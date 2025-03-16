part of 'game_session_section_cubit.dart';

@freezed
class GameSessionSectionState with _$GameSessionSectionState {
  const factory GameSessionSectionState.state({
    @Default(null) String? code,
    @Default(null) GameSession? session,
    @Default([]) List<Attempt> attempts,
    @Default(null) Level? currentLevel,
    @Default(null) User? user,
    @Default(null) String? gameId,
    @Default(null) String? activityId,
  }) = _GameSessionSectionState;
}
