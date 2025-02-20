import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/common/model/graph_types.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:math_expressions/math_expressions.dart';

Expression generatePositionExpression({
  required Pair<double, double> range,
  required double secondsDuration,
  required GraphTypes type,
  double? initialVelocity,
  double? initialPosition,
}) {
  switch (type) {
    case GraphTypes.constantVelocity:
      return generateConstantSpeed(
        range: range,
        secondsDuration: secondsDuration,
      );
    case GraphTypes.constantAcceleration:
      return generateUniformlyAccelerated(
        range: range,
        secondsDuration: secondsDuration,
      );
    case GraphTypes.constant:
      return generateConstant(range: range, value: initialPosition);
  }
}

Expression generateConstant({
  required Pair<double, double> range,
  double? value,
}) {
  value ??= range.first + Random().nextDouble() * (range.second - range.first);
  return Number(value);
}

Expression generateConstantSpeed({
  required Pair<double, double> range,
  required double secondsDuration,
  double? initialVelocity,
  double? initialPosition,
}) {
  assert(range.first < range.second, 'Range must be in ascending order');
  final random = Random();
  final rangeSize = range.second - range.first;

  initialPosition ??= range.first + random.nextDouble() * rangeSize;
  late final double finalPosition;
  if (initialPosition < rangeSize / 2) {
    finalPosition = range.second -
        random.nextDouble() * rangeSize / 4; // Valor en el último cuarto
  } else {
    finalPosition = initialPosition +
        random.nextDouble() * rangeSize / 4; // Valor en el primer cuarto
  }
  final speed = (finalPosition - initialPosition) / secondsDuration;

  final p0 = Number(initialPosition);
  final t = Variable('t');
  final v = Number(speed);
  final expression = p0 + v * t;
  Logger.d('Final position: $finalPosition');
  Logger.d('Expression: $expression');
  return expression;
}

Expression generateUniformlyAccelerated({
  required Pair<double, double> range,
  required double secondsDuration,
  double? initialVelocity,
  double? initialPosition,
}) {
  assert(range.first < range.second,
      'Range must be in ascending order'); // TODO: Remove
  final random = Random();
  final rangeSize = range.second - range.first;

  initialPosition ??= range.first + random.nextDouble() * rangeSize;
  late final double finalPosition;
  if (initialPosition < rangeSize / 2) {
    finalPosition = range.second -
        random.nextDouble() * rangeSize / 4; // Valor en el último cuarto
  } else {
    finalPosition = initialPosition +
        random.nextDouble() * rangeSize / 4; // Valor en el primer cuarto
  }
  const initialVelocity = 0.0; // m/s TODO: Randomize
  final acceleration = 2 *
      (finalPosition - initialPosition - (initialVelocity * secondsDuration)) /
      pow(secondsDuration, 2); // m/s^2 TODO: Randomize

  final t = Variable('t');
  final a = Number(acceleration);
  final v0 = Number(initialVelocity);
  final p0 = Number(initialPosition);
  final expression = p0 + v0 * t + (Number(0.5) * a * t * t);
  Logger.d('Expression: $expression');
  return expression;
}

List<Expression> generateSectioned({
  required Pair<double, double> range,
  required double secondsDuration,
  required int sections,
}) {
  assert(range.first < range.second,
      'Range must be in ascending order'); // TODO: Remove
  assert(sections > 0, 'Sections must be greater than 0');
  final mathContext = ContextModel();

  final sectionDuration = secondsDuration / sections;
  final initialPosition = range.first; // m TODO: Randomize
  final finalPosition = range.second; // m TODO: Randomize

  final expressions = <Expression>[];

  var latestPosition = initialPosition;

  for (var i = 0; i < sections; i++) {
    final initialPos = latestPosition; // TODO: Randomize
    final finalPos = finalPosition; // TODO: Randomize
    final graphType =
        GraphTypes.values[Random().nextInt(GraphTypes.values.length - 1)];
    switch (graphType) {
      case GraphTypes.constantAcceleration:
      case GraphTypes.constantVelocity:
        latestPosition = finalPos;
        break;
      case GraphTypes.constant:
        latestPosition = initialPos;
        break;
    }
    final expression = generatePositionExpression(
      range: range,
      secondsDuration: sectionDuration,
      type: graphType,
      initialPosition: i != 0 ? initialPos : null,
    );
    expressions.add(expression);
    mathContext.bindVariable(Variable('t'), Number((i + 1) * sectionDuration));
    latestPosition = expression.evaluate(EvaluationType.REAL, mathContext);
  }
  Logger.d('Expressions: $expressions');
  return expressions;
}

List<Expression> generateByDifficulty({
  required Pair<double, double> range,
  required double secondsDuration,
  required Difficulty difficulty,
}) {
  switch (difficulty) {
    case Difficulty.easy:
      return [
        generateConstantSpeed(
          range: range,
          secondsDuration: secondsDuration,
        )
      ];
    case Difficulty.medium:
      return [
        generateUniformlyAccelerated(
          range: range,
          secondsDuration: secondsDuration,
        )
      ];
    case Difficulty.hard:
      return generateSectioned(
        range: range,
        secondsDuration: secondsDuration,
        sections: 3,
      );
  }
}

Expression parseExpression(String expression) {
  final parser = Parser();
  final exp = parser.parse(expression);
  Logger.d("Parsed expression: $exp");
  return exp;
}

extension ExpressionExtensions on Expression {
  double evaluateAt(double t) {
    final context = ContextModel()..bindVariable(Variable('t'), Number(t));
    final result = evaluate(EvaluationType.REAL, context);
    Logger.d('Result: $result');
    return result.toDouble();
  }
}
