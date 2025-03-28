import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/user_type.dart';

part 'game_session_models.freezed.dart';

part 'game_session_models.g.dart';

@freezed
sealed class GameSessionJoinRequest with _$GameSessionJoinRequest {
  @JsonSerializable()
  factory GameSessionJoinRequest({
    @JsonKey(name: 'code') required String code,
  }) = _GameSessionJoinRequest;

  factory GameSessionJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$GameSessionJoinRequestFromJson(json);
}

@freezed
sealed class GameSessionCreateRequest with _$GameSessionCreateRequest {
  @JsonSerializable()
  factory GameSessionCreateRequest({
    @JsonKey(name: 'activityId') required String activityId,
    @JsonKey(name: 'teacherId') required String teacherId,
  }) = _GameSessionCreateRequest;

  factory GameSessionCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$GameSessionCreateRequestFromJson(json);
}

@freezed
class GameSessionJoinResponse with _$GameSessionJoinResponse {
  @JsonSerializable()
  factory GameSessionJoinResponse({
    required String id,
    required String activityId,
    required String teacherId,
    required String code,
  }) = _GameSessionJoinResponse;

  factory GameSessionJoinResponse.fromJson(Map<String, dynamic> json) =>
      _$GameSessionJoinResponseFromJson(json);
}
