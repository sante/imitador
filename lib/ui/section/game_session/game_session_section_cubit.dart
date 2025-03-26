import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/config.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/activity_repository.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'game_session_section_state.dart';

part 'game_session_section_cubit.freezed.dart';

class GameSessionSectionCubit extends Cubit<GameSessionSectionState> {
  final GameSessionRepository _sessionRepository = DiProvider.get();
  final ActivityRepository _activityRepository = DiProvider.get();
  final SessionRepository _authRepository = DiProvider.get();

  StreamSubscription? _sessionCodeSubscription;
  StreamSubscription? _gameIdSubscription;
  StreamSubscription? _userSubscription;
  Socket? socket;

  GameSessionSectionCubit() : super(const GameSessionSectionState.state()) {
    _initStreams();
    _initSocket();
  }

  void _initStreams() {
    _userSubscription = _authRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
    });

    _sessionCodeSubscription =
        _sessionRepository.getGameSessionCode().listen((code) {
      emit(state.copyWith(code: code));
    });

    _gameIdSubscription = _sessionRepository.getGameId().listen((gameId) {
      emit(state.copyWith(gameId: gameId));
      if (gameId != null) {
        _joinGame();
      }
    });
  }

  void _joinGame() {
    final gameId = state.gameId;

    if (gameId != null) {
      Logger.d('Joining game with ID: $gameId');
      socket!.emit(ClientGameEvents.JOIN_GAME.value, {
        'id': gameId,
        'userId': state.user?.id,
        'userName': state.user?.name,
      });
    } else {
      Logger.d('Cannot join game: game ID is null');
    }
  }

  void _initSocket() {
    // Initialize socket
    socket = io(
      Config.apiBaseUrl,
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );

    // Set up socket event handlers
    socket!.onConnect((data) {
      emit(state.copyWith(isConnected: true));
      _joinGame();
    });

    for (var event in ServerGameEvents.values) {
      socket!.on(event.value, (data) {
        Logger.d('Received event: ${event.value}');
        handleGameSessionUpdate(data);
      });
    }

    socket!.onDisconnect((_) {
      emit(state.copyWith(isConnected: false));
    });

    socket!.onConnectError((error) {
      Logger.e('Socket connection error: $error');
    });

    // Connect to the socket server
    socket!.connect();
  }

  void handleGameSessionUpdate(dynamic data) async {
    final gameSession = GameSession.fromJson(data);
    emit(state.copyWith(session: gameSession));
    fetchActivity(gameSession);
  }

  void fetchActivity(GameSession gameSession) async {
    if (state.activity == null ||
        state.activity!.id != gameSession.activityId) {
      emit(state.copyWith(activity: null));
      final activity = await _activityRepository
          .getSessionActivityById(gameSession.activityId);
      emit(state.copyWith(activity: activity));
    }
  }

  void setCurrentLevel(Level level) {
    emit(state.copyWith(currentLevel: level));
  }

  @override
  Future<void> close() {
    _sessionCodeSubscription?.cancel();
    _gameIdSubscription?.cancel();
    _userSubscription?.cancel();
    socket?.disconnect();
    socket?.dispose();
    return super.close();
  }

  void addAttemptFromSamples(List<Pair<double, double>> samples) {
    final attempt = attemptFromSamples(
      samples: samples,
      level: state.currentLevel!,
      player: state.user,
    );
    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }
}
