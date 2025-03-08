// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FixedLevelImpl _$$FixedLevelImplFromJson(Map<String, dynamic> json) =>
    _$FixedLevelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      range: const PairConverter().fromJson(json['range'] as String),
      secondsDuration: (json['secondsDuration'] as num).toDouble(),
      type: $enumDecodeNullable(_$LevelTypeEnumMap, json['type']) ??
          LevelType.position,
      expressions: (json['expressions'] as List<dynamic>)
          .map((e) => const ExpressionConverter().fromJson(e as String))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FixedLevelImplToJson(_$FixedLevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'range': const PairConverter().toJson(instance.range),
      'secondsDuration': instance.secondsDuration,
      'type': _$LevelTypeEnumMap[instance.type]!,
      'expressions':
          instance.expressions.map(const ExpressionConverter().toJson).toList(),
      'runtimeType': instance.$type,
    };

const _$LevelTypeEnumMap = {
  LevelType.position: 'POSITION',
  LevelType.speed: 'SPEED',
};

_$RandomLevelImpl _$$RandomLevelImplFromJson(Map<String, dynamic> json) =>
    _$RandomLevelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      type: $enumDecodeNullable(_$LevelTypeEnumMap, json['type']) ??
          LevelType.position,
      range: const PairConverter().fromJson(json['range'] as String),
      secondsDuration: (json['secondsDuration'] as num).toDouble(),
      expressions: (json['expressions'] as List<dynamic>?)
          ?.map((e) => const ExpressionConverter().fromJson(e as String))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RandomLevelImplToJson(_$RandomLevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'type': _$LevelTypeEnumMap[instance.type]!,
      'range': const PairConverter().toJson(instance.range),
      'secondsDuration': instance.secondsDuration,
      'expressions': instance.expressions
          ?.map(const ExpressionConverter().toJson)
          .toList(),
      'runtimeType': instance.$type,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
