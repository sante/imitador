// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LevelImpl _$$LevelImplFromJson(Map<String, dynamic> json) => _$LevelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      difficulty: $enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']),
      minPosition: (json['minPosition'] as num).toDouble(),
      maxPosition: (json['maxPosition'] as num).toDouble(),
      secondsDuration: (json['duration'] as num).toDouble(),
      type: $enumDecodeNullable(_$LevelTypeEnumMap, json['type']) ??
          LevelType.position,
      positionExpressions: (json['positionExpressions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      speedExpressions: (json['speedExpressions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LevelImplToJson(_$LevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
      'minPosition': instance.minPosition,
      'maxPosition': instance.maxPosition,
      'duration': instance.secondsDuration,
      'type': _$LevelTypeEnumMap[instance.type]!,
      'positionExpressions': instance.positionExpressions,
      'speedExpressions': instance.speedExpressions,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'EASY',
  Difficulty.medium: 'MEDIUM',
  Difficulty.hard: 'HARD',
};

const _$LevelTypeEnumMap = {
  LevelType.position: 'POSITION',
  LevelType.speed: 'SPEED',
};
