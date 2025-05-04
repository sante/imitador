import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/enum/level_type.dart';
import 'package:imitador/model/level_expression/level_expression.dart';
import 'package:math_expressions/math_expressions.dart';

part 'level.freezed.dart';

part 'level.g.dart';

@freezed
sealed class Level with _$Level {
  factory Level({
    required String id,
    required String name,
    required Difficulty? difficulty,
    required double minPosition,
    required double maxPosition,
    @JsonKey(name: "duration") required double secondsDuration,
    @Default(LevelType.position) LevelType type,
    required List<String> positionExpressions,
    required List<String> speedExpressions,
  }) = _Level;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}
