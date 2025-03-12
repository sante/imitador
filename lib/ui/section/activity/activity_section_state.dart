part of 'activity_section_cubit.dart';

@freezed
class ActivitySectionState with _$ActivitySectionState {
  const factory ActivitySectionState.state({
    @Default(null) Activity? activity,
    @Default([]) List<Attempt> attempts,
    @Default(null) Level? currentLevel,
    @Default(null) User? user,
    @Default(true) bool isLoading,
  }) = _ActivitySectionState;
}
