part of 'game_session_section_cubit.dart';

@freezed
class GameSessionSectionState with _$GameSessionSectionState {
  const factory GameSessionSectionState.state({
    required GameSession session,
    @Default([]) List<Attempt> attempts,
    @Default(null) User? user,
  }) = _GameSessionSectionState;
}
