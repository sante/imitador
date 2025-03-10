import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/level_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'sign_up_section_state.dart';

part 'sign_up_section_cubit.freezed.dart';

class SignUpSectionCubit extends Cubit<SignUpSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final LevelRepository _levelRepository = DiProvider.get();

  late StreamSubscription<User?> _userSubscription;
  late StreamSubscription<List<Level>?> _levelsSubscription;

  SignUpSectionCubit() : super(const SignUpSectionState.state()) {
    _initStreams();
  }

  void _initStreams() async {
  }

  void logOut() {
    _sessionRepository.logOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    _levelsSubscription.cancel();
    return super.close();
  }
}
