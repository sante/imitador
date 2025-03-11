import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/level_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';

part 'sign_up_section_state.dart';

part 'sign_up_section_cubit.freezed.dart';

class SignUpSectionCubit extends Cubit<SignUpSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final LevelRepository _levelRepository = DiProvider.get();

  late StreamSubscription<User?>? _userSubscription;
  late StreamSubscription<List<Level>?>? _levelsSubscription;

  SignUpSectionCubit() : super(const SignUpSectionState.state()) {
    _initStreams();
  }

  void _initStreams() async {
  }

  void setUserType(UserType userType) {
    emit(state.copyWith(userType: userType));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setCode(String code) {
    emit(state.copyWith(code: code));
  }

  Future<void> requestCode() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _sessionRepository.requestSignUpCode(state.email);
      emit(state.copyWith(isLoading: false, codeSent: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> signUp() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _sessionRepository.signUpUser(
        email: state.email,
        name: state.name,
        code: state.code,
        userType: state.userType!,
      );
      emit(state.copyWith(isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }


  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _levelsSubscription?.cancel();
    return super.close();
  }
}
