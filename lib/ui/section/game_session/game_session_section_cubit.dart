import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'game_session_section_state.dart';

part 'game_session_section_cubit.freezed.dart';

class GameSessionSectionCubit extends Cubit<GameSessionSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  StreamSubscription? _authSubscription;

  GameSessionSectionCubit({
    required GameSession session,
  }) : super(GameSessionSectionState.state(
          session: session,
        )) {
    _initStreams();
  }

  void _initStreams() {
    _authSubscription = _sessionRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  void addAttemptFromSamples(List<Pair<double, double>> samples, Level level) {
    final attempt = attemptFromSamples(
        samples: samples, level: level, player: state.user,
    );
    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }
}
