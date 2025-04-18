part of 'global_section_cubit.dart';

@freezed
class GlobalSectionState with _$GlobalSectionState {
  const factory GlobalSectionState.state({
    required MicrobitController microbitController,
    @Default(false) bool usingMicrobit,
    @Default(null) String? microbitError,
    @Default(null) User? user,
    @Default(null) List<Level>? levels,
    @Default(null) List<Activity>? activities,
  }) = _GlobalSectionStateState;
}
