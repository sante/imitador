import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/level_expression/level_expression.dart';
import 'package:math_expressions/math_expressions.dart';

part 'level.freezed.dart';

part 'level.g.dart';

@freezed
sealed class Level with _$Level {
  @JsonSerializable()
  factory Level.activity({
    required String name,
    @PairConverter() required Pair<double, double> range,
    required double secondsDuration,
    @ExpressionConverter() required LevelExpressions expressions,
  }) = Activity;

  @JsonSerializable()
  factory Level.random({
    required String name,
    required Difficulty difficulty,
    @PairConverter() required Pair<double, double> range,
    required double secondsDuration,
    @ExpressionConverter() LevelExpressions?
        expressions, // Maybe we need this to keep historic records
  }) = RandomLevel;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}

class ExpressionConverter implements JsonConverter<Expression, String> {
  const ExpressionConverter();

  @override
  Expression fromJson(String string) {
    return Parser().parse(string);
  }

  @override
  String toJson(Expression expression) => expression.toString();
}

class PairConverter implements JsonConverter<Pair<double, double>, String> {
  const PairConverter();

  @override
  Pair<double, double> fromJson(String string) {
    final list = string.split(', ').map((e) => double.parse(e)).toList();
    return Pair(list[0], list[1]);
  }

  @override
  String toJson(Pair<double, double> pair) => "${pair.first}, ${pair.second}";
}
