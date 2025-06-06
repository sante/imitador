// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSessionImpl _$$GameSessionImplFromJson(Map<String, dynamic> json) =>
    _$GameSessionImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      teacher: SessionTeacher.fromJson(json['teacher'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityId: json['activityId'] as String,
      playing: json['playing'] as bool,
      ended: json['ended'] as bool,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      goToLevel: json['goToLevel'] as String?,
      showResultsButton: json['showResultsButton'] as bool?,
    );

Map<String, dynamic> _$$GameSessionImplToJson(_$GameSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'teacher': instance.teacher,
      'players': instance.players,
      'activityId': instance.activityId,
      'playing': instance.playing,
      'ended': instance.ended,
      'userId': instance.userId,
      'userName': instance.userName,
      'goToLevel': instance.goToLevel,
      'showResultsButton': instance.showResultsButton,
    };

_$SessionTeacherImpl _$$SessionTeacherImplFromJson(Map<String, dynamic> json) =>
    _$SessionTeacherImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      socketId: json['socketId'] as String?,
    );

Map<String, dynamic> _$$SessionTeacherImplToJson(
        _$SessionTeacherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'socketId': instance.socketId,
    };

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      socketId: json['socketId'] as String,
      score: (json['score'] as List<dynamic>?)
          ?.map((e) => Score.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'socketId': instance.socketId,
      'score': instance.score,
    };

_$ScoreImpl _$$ScoreImplFromJson(Map<String, dynamic> json) => _$ScoreImpl(
      levelId: json['levelId'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$ScoreImplToJson(_$ScoreImpl instance) =>
    <String, dynamic>{
      'levelId': instance.levelId,
      'score': instance.score,
    };
