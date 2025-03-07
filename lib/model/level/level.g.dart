// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      name: json['name'] as String,
      range: const PairConverter().fromJson(json['range'] as String),
      secondsDuration: (json['secondsDuration'] as num).toDouble(),
      expressions: (json['expressions'] as List<dynamic>)
          .map((e) => const ExpressionConverter().fromJson(e as String))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'range': const PairConverter().toJson(instance.range),
      'secondsDuration': instance.secondsDuration,
      'expressions':
          instance.expressions.map(const ExpressionConverter().toJson).toList(),
      'runtimeType': instance.$type,
    };

_$RandomLevelImpl _$$RandomLevelImplFromJson(Map<String, dynamic> json) =>
    _$RandomLevelImpl(
      name: json['name'] as String,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      range: const PairConverter().fromJson(json['range'] as String),
      secondsDuration: (json['secondsDuration'] as num).toDouble(),
      expressions: (json['expressions'] as List<dynamic>?)
          ?.map((e) => const ExpressionConverter().fromJson(e as String))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RandomLevelImplToJson(_$RandomLevelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
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
