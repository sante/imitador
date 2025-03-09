part of 'log_in_cubit.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState.state({
    @Default('') String email,
    @Default('') String code,
    @Default(false) bool isLoading,
}) = _LogInState;
}
