import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/user/user.dart';


part 'game_session.freezed.dart';
part 'game_session.g.dart';

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String code,
    required String teacherId,
    required String activityId,
    required Activity activity,
    required List<User> students,
    @Default([]) List<Attempt> attempts,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) => _$GameSessionFromJson(json);
}