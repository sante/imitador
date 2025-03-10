part of 'sign_up_section_cubit.dart';

@freezed
class SignUpSectionState with _$SignUpSectionState {
  const factory SignUpSectionState.state({
    @Default(null) List<Level>? levels,
  }) = _SignUpSectionStateState;
}
