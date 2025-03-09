import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/level_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'global_section_state.dart';

part 'global_section_cubit.freezed.dart';

class GlobalSectionCubit extends Cubit<GlobalSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final LevelRepository _levelRepository = DiProvider.get();

  late StreamSubscription<User?> _userSubscription;
  late StreamSubscription<List<Level>?> _levelsSubscription;

  GlobalSectionCubit() : super(const GlobalSectionState.state()) {
    _initStreams();
  }

  void _initStreams() async {
    _userSubscription = _sessionRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
    });
    // _levelsSubscription = _levelRepository.getLevels().listen((levels) {
    //   emit(state.copyWith(levels: levels));
    //   Logger.d('GlobalSectionCubit._initStreams: levels: $levels');
    // });
    final levels = await _levelRepository.getDirectLevels();
    emit(state.copyWith(levels: levels));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    _levelsSubscription.cancel();
    return super.close();
  }
}
