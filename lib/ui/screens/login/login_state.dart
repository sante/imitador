part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.state({
    @Default(null) User? user,
  }) = _LoginState;
}
