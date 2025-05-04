import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/extension/string_extensions.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/attempt_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';
import 'package:math_expressions/math_expressions.dart';

part 'level_section_state.dart';

part 'level_section_cubit.freezed.dart';

class LevelSectionCubit extends Cubit<LevelSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final AttemptRepository _attemptRepository = DiProvider.get();

  StreamSubscription? _authSubscription;

  LevelSectionCubit({
    required Level level,
  }) : super(LevelSectionState.state(
          level: level,
        )) {
    if (level.id != "freeMovement" && level.positionExpressions.isEmpty) {
      final positionExpressions = generateByDifficulty(
        range: Pair(level.minPosition, level.maxPosition),
        secondsDuration: level.secondsDuration,
        difficulty: level.difficulty!,
      );
      final speedExpressions =
          positionExpressions.map((it) => it.derive("t").simplify());

      emit(state.copyWith(
        level: level.copyWith(
          positionExpressions: positionExpressions.mapToString,
          speedExpressions: speedExpressions.mapToString,
        ),
      ));
    } else if (level.speedExpressions.isEmpty) {
      emit(state.copyWith(
        level: level.copyWith(
          speedExpressions: level.positionExpressions
              .map((it) => parseExpression(it).derive("t").simplify())
              .mapToString,
        ),
      ));
    }
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
      samples: samples,
      level: state.level,
      player: state.user,
    );
    _attemptRepository.saveAttempt(attempt);
    emit(state.copyWith(attempts: [...state.attempts, attempt]));
  }
}
