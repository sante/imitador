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
    @ExpressionConverter() required LevelExpressions expressions,
  }) = Activity;

  @JsonSerializable()
  factory Level.random({
    required String name,
    required Difficulty difficulty,
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
