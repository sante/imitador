part of 'sign_up_section_cubit.dart';

@freezed
class SignUpSectionState with _$SignUpSectionState {
  const factory SignUpSectionState.state({
    @Default(null) UserType? userType,
    @Default("") String email,
    @Default("") String name,
    @Default("") String code,
    @Default(false) bool codeSent,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _SignUpSectionStateState;
}
