import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/model/service/game_session_models.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'game_session_section_state.dart';

part 'game_session_section_cubit.freezed.dart';

class GameSessionSectionCubit extends Cubit<GameSessionSectionState> {
  final GameSessionRepository _sessionRepository = DiProvider.get();

  StreamSubscription? _sessionCodeSubscription;

  GameSessionSectionCubit() : super(const GameSessionSectionState.state()) {
    _initStreams();
    _loadGameSessionData();
  }

  void _initStreams() {
    _sessionCodeSubscription =
        _sessionRepository.getGameSessionCode().listen((code) {
      emit(state.copyWith(code: code));
    });
  }

  void _loadGameSessionData() {
    final gameId = _sessionRepository.getGameId();

    if (gameId != null) {
      gameId.listen((id) {
        if (id != null) {
          emit(state.copyWith(
            gameId: id,
          ));
        }
      });
    }
  }

  @override
  Future<void> close() {
    _sessionCodeSubscription?.cancel();
    return super.close();
  }

  Future<void> joinGameSession(String code) async {
    try {
      final response = await _sessionRepository.joinGameSession(code);
      emit(state.copyWith(
        gameId: response.id,
      ));
    } catch (e) {
      print('Error joining game session: $e');
    }
  }

  void setGameId({required String gameId}) {
    emit(state.copyWith(
      gameId: gameId,
    ));
  }

  void addAttemptFromSamples(List<Pair<double, double>> samples, Level level) {
    final attempt = attemptFromSamples(
      samples: samples,
      level: level,
      player: state.user,
    );
    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }
}
