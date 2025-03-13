import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/user_type.dart';

part 'game_session_models.freezed.dart';

part 'game_session_models.g.dart';

@freezed
sealed class GameSessionValidateRequest with _$GameSessionValidateRequest {
  @JsonSerializable()
  factory GameSessionValidateRequest({
    @JsonKey(name: 'code') required String code,
  }) = _GameSessionValidateRequest;

  factory GameSessionValidateRequest.fromJson(Map<String, dynamic> json) =>
      _$GameSessionValidateRequestFromJson(json);
}
