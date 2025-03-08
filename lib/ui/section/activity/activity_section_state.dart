part of 'activity_section_cubit.dart';

@freezed
class ActivitySectionState with _$ActivitySectionState {
  const factory ActivitySectionState.state({
    required Activity activity,
    @Default([]) List<Attempt> attempts,
    @Default(null) User? user,
  }) = _ActivitySectionState;
}
