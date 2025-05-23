import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/config.dart';
import 'package:imitador/core/common/extension/string_extensions.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/activity_repository.dart';
import 'package:imitador/core/repository/attempt_repository.dart';
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
  final AttemptRepository _attemptRepository = DiProvider.get();

  StreamSubscription? _sessionCodeSubscription;
  StreamSubscription? _gameIdSubscription;
  StreamSubscription? _userSubscription;
  StreamSubscription? _creatorSubscription;
  Socket? socket;

  GameSessionSectionCubit() : super(const GameSessionSectionState.state()) {
    _initStreams();
    _initSocket();
  }

  void _initStreams() {
    _userSubscription = _authRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
      _tryJoin();
    });

    _sessionCodeSubscription =
        _sessionRepository.getGameSessionCode().listen((code) {
      emit(state.copyWith(code: code));
      _tryJoin();
    });

    _gameIdSubscription = _sessionRepository.getGameId().listen((gameId) {
      emit(state.copyWith(gameId: gameId));
      _tryJoin();
    });

    _creatorSubscription = _sessionRepository.getCreatorId().listen((creator) {
      emit(state.copyWith(creatorId: creator));
      _tryJoin();
    });
  }

  void _tryJoin() {
    if (state.gameId != null &&
        state.creatorId != null &&
        state.user?.id != null) {
      if (state.user is Teacher && state.creatorId == state.user?.id) {
        _createGame();
      } else if (state.user != null) {
        _joinGame();
      }
    }
  }

  void _createGame() {
    final gameId = state.gameId;

    if (gameId != null) {
      Logger.d('Creating game with gameId: $gameId');
      socket!.emit(ClientGameEvents.CREATE_GAME.value, {
        'id': gameId,
        'userId': state.user?.id,
        'userName': state.user?.name,
      });
    } else {
      Logger.d('Cannot create game: gameId is null');
    }
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
      _tryJoin();
    });

    // Handle SEND_TO_LEVEL event separately
    socket!.on(ServerGameEvents.SEND_TO_LEVEL.value, (data) {
      Logger.d('Received SEND_TO_LEVEL event with data: $data');
      if (data != null && data['levelId'] != null) {
        String levelId = data['levelId'];
        emit(state.copyWith(navigateToLevelId: levelId));
      }
    });

    // Handle SHOW_PLOT_RESULT event separately
    socket!.on(ServerGameEvents.SHOW_PLOT_RESULT.value, (data) {
      Logger.d('Received SHOW_PLOT_RESULT event with data: $data');
      emit(state.copyWith(showPlotResult: true));
    });

    // Handle all other events
    for (var event in ServerGameEvents.values.where((e) =>
        e != ServerGameEvents.SEND_TO_LEVEL &&
        e != ServerGameEvents.SHOW_PLOT_RESULT)) {
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
    if (level.speedExpressions.isEmpty) {
      emit(state.copyWith(
        currentLevel: level.copyWith(
          speedExpressions: level.positionExpressions
              .map((it) => parseExpression(it).derive("t").simplify())
              .mapToString,
        ),
      ));
    } else {
      emit(state.copyWith(currentLevel: level));
    }
  }

  void startGame() {
    socket!.emit(ClientGameEvents.START_GAME.value, {
      'id': state.gameId,
    });
  }

  void stopGame() {
    socket!.emit(ClientGameEvents.END_GAME.value, {
      'id': state.gameId,
    });
  }

  @override
  Future<void> close() {
    _sessionCodeSubscription?.cancel();
    _gameIdSubscription?.cancel();
    _userSubscription?.cancel();
    _creatorSubscription?.cancel();
    socket?.disconnect();
    socket?.dispose();
    return super.close();
  }

  void addAttemptFromSamples(List<Pair<double, double>> samples) {
    final attempt = attemptFromSamples(
      samples: samples,
      level: state.currentLevel!,
      player: state.user,
    ).copyWith(
      gameSessionId: state.gameId,
    );
    socket!.emit(ClientGameEvents.UPDATE_GAME_STATE.value, {
      'id': state.gameId,
      'playerId': state.user?.id,
      'levelId': state.currentLevel?.id,
      'score': attempt.score,
    });
    _attemptRepository.saveAttempt(attempt);

    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }

  void sendNavigationTarget(String levelId) {
    if (state.user is Teacher && state.gameId != null) {
      socket!.emit(ClientGameEvents.TEACHER_SET_NAVIGATION_TARGET.value, {
        'id': state.gameId,
        'levelId': levelId,
      });
    } else {
      Logger.e(
          'Cannot send navigation target: User is not a teacher or gameId is null');
    }
  }

  void sendShowPlotResult() {
    if (state.user is Teacher && state.gameId != null) {
      socket!.emit(ClientGameEvents.TEACHER_SHOW_PLOT_RESULT.value, {
        'id': state.gameId,
      });
    } else {
      Logger.e(
          'Cannot send show plot result: User is not a teacher or gameId is null');
    }
  }

  void resetShowPlotResult() {
    emit(state.copyWith(showPlotResult: false));
  }

  void resetNavigateToLevelId() {
    emit(state.copyWith(navigateToLevelId: null));
  }
}
