import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/model/service/game_session_models.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/core/common/network_exceptions.dart';

part 'join_session_state.dart';

part 'join_session_cubit.freezed.dart';

class JoinSessionCubit extends Cubit<JoinSessionState> {
  final GameSessionRepository _sessionRepository = DiProvider.get();

  JoinSessionCubit() : super(const JoinSessionState.state());

  void setCode(String code) {
    emit(state.copyWith(code: code));
  }

  Future<bool> validateSessionCode() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await _sessionRepository.validateGameSessionCode(state.code);
      emit(state.copyWith(isLoading: false));
      return true;
    } catch (e) {
      final errorMessage = e is NetworkException
          ? NetworkException.getErrorMessage(e)
          : e.toString();
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  Future<GameSessionJoinResponse?> joinGameSession() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final response = await _sessionRepository.joinGameSession(state.code);
      emit(state.copyWith(isLoading: false));
      return response;
    } catch (e) {
      final errorMessage = e is NetworkException
          ? NetworkException.getErrorMessage(e)
          : e.toString();
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return null;
    }
  }
}
