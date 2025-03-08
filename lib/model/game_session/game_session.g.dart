// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSessionImpl _$$GameSessionImplFromJson(Map<String, dynamic> json) =>
    _$GameSessionImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      teacherId: json['teacherId'] as String,
      activityId: json['activityId'] as String,
      activity: Activity.fromJson(json['activity'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      attempts: (json['attempts'] as List<dynamic>?)
              ?.map((e) => Attempt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GameSessionImplToJson(_$GameSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'teacherId': instance.teacherId,
      'activityId': instance.activityId,
      'activity': instance.activity,
      'students': instance.students,
      'attempts': instance.attempts,
    };
