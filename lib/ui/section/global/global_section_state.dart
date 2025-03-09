part of 'global_section_cubit.dart';

@freezed
class GlobalSectionState with _$GlobalSectionState {
  const factory GlobalSectionState.state({
    @Default(null) User? user,
  }) = _GlobalSectionStateState;
}
