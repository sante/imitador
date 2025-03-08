part of 'level_section_cubit.dart';

@freezed
class LevelSectionState with _$LevelSectionState {
  const factory LevelSectionState.state({
    required Level level,
    @Default([]) List<Attempt> attempts,
    @Default(null) User? user,
  }) = _LevelSectionState;
}
