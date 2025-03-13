import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';

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
      return true;
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
      return false;
    }
  }
}
