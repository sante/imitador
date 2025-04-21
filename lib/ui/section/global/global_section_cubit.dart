import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/device/microbit_controller.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/activity_repository.dart';
import 'package:imitador/core/repository/level_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'global_section_state.dart';

part 'global_section_cubit.freezed.dart';

class GlobalSectionCubit extends Cubit<GlobalSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final LevelRepository _levelRepository = DiProvider.get();
  final ActivityRepository _activityRepository = DiProvider.get();

  StreamSubscription<User?>? _userSubscription;
  StreamSubscription<List<Level>?>? _levelsSubscription;
  StreamSubscription<List<Activity>?>? _activitiesSubscription;

  GlobalSectionCubit()
      : super(GlobalSectionState.state(
          microbitController: MicrobitController(),
        )) {
    _initStreams();
  }

  void _initStreams() async {
    _userSubscription = _sessionRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
      _activityRepository.refresh();
      _levelRepository.getLevels();
    });
    _levelsSubscription = _levelRepository.getLevels().listen((levels) {
      emit(state.copyWith(levels: levels));
      Logger.d('GlobalSectionCubit._initStreams: levels: ${levels?.length}');
    });
    _activitiesSubscription =
        _activityRepository.getActivities().listen((activities) {
      emit(state.copyWith(activities: activities));
      Logger.d(
          'GlobalSectionCubit._initStreams: activities: ${activities?.length}');
    });
  }

  Future<bool> connectMicrobit() async {
    final connected = await state.microbitController.connect();
    emit(state.copyWith(
      usingMicrobit: connected,
      microbitError: connected ? null : 'Error al conectar con Microbit',
    ));
    return connected;
  }

  Future<void> logOut() async {
    await _sessionRepository.logOut();
    _levelRepository.refreshLevels();
    _activityRepository.refresh();
    emit(
      state.copyWith(
        user: null,
      ),
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _levelsSubscription?.cancel();
    state.microbitController.disconnect();
    return super.close();
  }
}
