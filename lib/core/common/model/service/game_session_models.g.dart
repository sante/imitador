// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSessionJoinRequestImpl _$$GameSessionJoinRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GameSessionJoinRequestImpl(
      code: json['code'] as String,
    );

Map<String, dynamic> _$$GameSessionJoinRequestImplToJson(
        _$GameSessionJoinRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

_$GameSessionJoinResponseImpl _$$GameSessionJoinResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GameSessionJoinResponseImpl(
      id: json['id'] as String,
      activityId: json['activityId'] as String,
    );

Map<String, dynamic> _$$GameSessionJoinResponseImplToJson(
        _$GameSessionJoinResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityId': instance.activityId,
    };
