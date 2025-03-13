part of 'join_session_cubit.dart';

@freezed
class JoinSessionState with _$JoinSessionState {
  const factory JoinSessionState.state({
    @Default('') String code,
    @Default(false) bool isLoading,
    String? error,
  }) = _JoinSessionState;
}
