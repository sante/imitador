import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_session.freezed.dart';
part 'game_session.g.dart';

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String code,
    required Teacher teacher,
    required List<Player> players,
    required String activityId,
    required bool playing,
    String? userId,
    String? userName,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}

@freezed
class Teacher with _$Teacher {
  const factory Teacher({
    required String id,
    required String name,
    String? socketId,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    required String socketId,
    List<Score>? score,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
class Score with _$Score {
  const factory Score({
    required String levelId,
    required int score,
  }) = _Score;

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
}

enum ServerGameEvents {
  PLAYER_JOINED,
  PLAYER_DISCONNECTED,
  PLAYER_RECONNECTED,
  GAME_STARTED,
  GAME_ENDED,
  GAME_ERROR,
  GAME_STATE_UPDATED,
}

extension ServerGameEventsExtension on ServerGameEvents {
  String get value => switch (this) {
        ServerGameEvents.PLAYER_JOINED => 'server:game:player:joined',
        ServerGameEvents.PLAYER_DISCONNECTED =>
          'server:game:player:disconnected',
        ServerGameEvents.PLAYER_RECONNECTED => 'server:game:player:reconnected',
        ServerGameEvents.GAME_STARTED => 'server:game:started',
        ServerGameEvents.GAME_ENDED => 'server:game:ended',
        ServerGameEvents.GAME_ERROR => 'server:game:error',
        ServerGameEvents.GAME_STATE_UPDATED => 'server:game:state:updated',
      };
}

enum ClientGameEvents {
  CREATE_GAME,
  JOIN_GAME,
  LEAVE_GAME,
  START_GAME,
  END_GAME,
  UPDATE_GAME_STATE,
  RECONNECT,
}

extension ClientGameEventsExtension on ClientGameEvents {
  String get value => switch (this) {
        ClientGameEvents.CREATE_GAME => 'client:game:create',
        ClientGameEvents.JOIN_GAME => 'client:game:join',
        ClientGameEvents.LEAVE_GAME => 'client:game:leave',
        ClientGameEvents.START_GAME => 'client:game:start',
        ClientGameEvents.END_GAME => 'client:game:end',
        ClientGameEvents.UPDATE_GAME_STATE => 'client:game:state:update',
        ClientGameEvents.RECONNECT => 'client:game:reconnect',
      };
}
