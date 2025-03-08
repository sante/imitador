import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'level_section_state.dart';

part 'level_section_cubit.freezed.dart';

class LevelSectionCubit extends Cubit<LevelSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  StreamSubscription? _authSubscription;

  LevelSectionCubit({
    required Level level,
  }) : super(LevelSectionState.state(
          level: level.copyWith(
            expressions: level.expressions ??
                generateByDifficulty(
                  range: level.range,
                  secondsDuration: level.secondsDuration,
                  difficulty: (level as RandomLevel).difficulty,
                ),
          ),
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

  void addAttemptFromSamples(List<Pair<double, double>> samples) {
    final attempt = attemptFromSamples(
        samples: samples, level: state.level, player: state.user,
    );
    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }
}
