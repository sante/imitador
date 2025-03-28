// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttemptImpl _$$AttemptImplFromJson(Map<String, dynamic> json) =>
    _$AttemptImpl(
      id: json['id'] as String?,
      score: (json['score'] as num).toInt(),
      stars: (json['stars'] as num).toInt(),
      plotPointsX: (json['plotPointsX'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      plotPointsY: (json['plotPointsY'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      interfaceType: $enumDecode(_$InterfaceTypeEnumMap, json['interfaceType']),
      expressions: (json['expressions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      levelId: json['levelId'] as String,
      level: Level.fromJson(json['level'] as Map<String, dynamic>),
      playerId: json['playerId'] as String?,
      gameSessionId: json['gameSessionId'] as String?,
    );

Map<String, dynamic> _$$AttemptImplToJson(_$AttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'stars': instance.stars,
      'plotPointsX': instance.plotPointsX,
      'plotPointsY': instance.plotPointsY,
      'interfaceType': _$InterfaceTypeEnumMap[instance.interfaceType]!,
      'expressions': instance.expressions,
      'levelId': instance.levelId,
      'level': instance.level,
      'playerId': instance.playerId,
      'gameSessionId': instance.gameSessionId,
    };

const _$InterfaceTypeEnumMap = {
  InterfaceType.sensor: 'sensor',
  InterfaceType.mouse: 'mouse',
};
