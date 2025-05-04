import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/extension/string_extensions.dart';
import 'package:imitador/core/common/helper/attempt_helper.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/activity_repository.dart';
import 'package:imitador/core/repository/attempt_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'activity_section_state.dart';

part 'activity_section_cubit.freezed.dart';

class ActivitySectionCubit extends Cubit<ActivitySectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final ActivityRepository _activityRepository = DiProvider.get();
  final AttemptRepository _attemptRepository = DiProvider.get();
  final String activityId;

  StreamSubscription? _authSubscription;

  ActivitySectionCubit({
    required this.activityId,
  }) : super(const ActivitySectionState.state()) {
    _initStreams();
  }

  void _initStreams() async {
    _authSubscription = _sessionRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
    });
    final activity = await _activityRepository.getActivityById(activityId);
    emit(state.copyWith(activity: activity, isLoading: false));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
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

  void addAttemptFromSamples(
    List<Pair<double, double>> samples,
  ) {
    if (state.currentLevel != null) {
      final attempt = attemptFromSamples(
        samples: samples,
        player: state.user,
        level: state.currentLevel!,
      );
      _attemptRepository.saveAttempt(attempt);

      emit(state.copyWith(attempts: [...state.attempts, attempt]));
    }
  }
}
