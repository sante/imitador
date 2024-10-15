import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:imitador/common/logger.dart';
import 'package:imitador/common/model/graph_types.dart';
import 'package:math_expressions/math_expressions.dart';

Expression generatePositionExpression(
  Pair<double, double> range,
  Duration duration,
  GraphTypes type,
) {
  switch (type) {
    case GraphTypes.constantVelocity:
      return generateConstantSpeed(range, duration);
    case GraphTypes.constantAcceleration:
      return generateUniformlyAccelerated(range, duration);
    case GraphTypes.constant:
      return generateConstant(range);
  }
}

Expression generateConstant(Pair<double, double> range) {
  assert(range.first < range.second, 'Range must be in ascending order');

  return Number(range.first);
}

Expression generateConstantSpeed(
  Pair<double, double> range,
  Duration duration,
) {
  assert(range.first < range.second, 'Range must be in ascending order');

  final initialPosition = range.first; // m TODO: Randomize
  final finalPosition = range.second; // m TODO: Randomize
  final speed = (finalPosition - initialPosition) / duration.inSeconds;

  final p0 = Number(initialPosition);
  final t = Variable('t');
  final v = Number(speed);
  final expression = p0 + v * t;
  Logger.d('Final position: $finalPosition');
  Logger.d('Expression: $expression');
  return expression;
}

Expression generateUniformlyAccelerated(
  Pair<double, double> range,
  Duration duration,
) {
  assert(range.first < range.second, 'Range must be in ascending order');

  final initialPosition = range.first; // m TODO: Randomize
  final finalPosition = range.second; // m TODO: Randomize
  final initialVelocity = 0.0; // m/s TODO: Randomize
  final acceleration = 2 *
      (finalPosition -
          initialPosition -
          (initialVelocity * duration.inSeconds)) /
      pow(duration.inSeconds, 2); // m/s^2 TODO: Randomize

  final t = Variable('t');
  final a = Number(acceleration);
  final v0 = Number(initialVelocity);
  final p0 = Number(initialPosition);
  final expression = p0 + v0 * t + (Number(0.5) * a * t * t);
  Logger.d('Expression: $expression');
  return expression;
}

List<Expression> generateSectioned(
  Pair<double, double> range,
  Duration duration,
  int sections,
) {
  assert(range.first < range.second, 'Range must be in ascending order');
  assert(sections > 0, 'Sections must be greater than 0');

  final sectionDuration = duration ~/ sections;
  final initialPosition = range.first; // m TODO: Randomize
  final finalPosition = range.second; // m TODO: Randomize

  final expressions = <Expression>[];

  var latestPosition = initialPosition;

  for (var i = 0; i < sections; i++) {
    final initialPos = latestPosition; // TODO: Randomize
    final finalPos = initialPos +
        (finalPosition - initialPos) * (i + 1) / sections; // TODO: Randomize
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
        Pair(initialPos, finalPos), sectionDuration, graphType);
    expressions.add(expression);
  }
  Logger.d('Expressions: $expressions');
  return expressions;
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
