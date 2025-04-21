import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/core/common/network_exceptions.dart';

part 'log_in_state.dart';

part 'log_in_cubit.freezed.dart';

class LogInCubit extends Cubit<LogInState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  LogInCubit() : super(const LogInState.state());

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setCode(String code) {
    emit(state.copyWith(code: code));
  }

  Future<void> requestCode() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _sessionRepository.requestSignInCode(state.email);
      emit(state.copyWith(isLoading: false, codeSent: true));
    } catch (e) {
      final errorMessage = e is NetworkException
          ? NetworkException.getErrorMessage(e)
          : e.toString();
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _sessionRepository.signInUser(
        email: state.email,
        code: state.code,
      );
      emit(state.copyWith(isLoading: false, error: null));
    } catch (e) {
      final errorMessage = e is NetworkException
          ? NetworkException.getErrorMessage(e)
          : e.toString();
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
