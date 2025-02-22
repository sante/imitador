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
  double? initialPosition,
  required initialTime,
}) {
  switch (type) {
    case GraphTypes.constantVelocity:
      return generateConstantSpeed(
        range: range,
        secondsDuration: secondsDuration,
        initialTime: initialTime,
        initialPosition: initialPosition,
      );
    case GraphTypes.constantAcceleration:
      return generateUniformlyAccelerated(
        range: range,
        secondsDuration: secondsDuration,
        initialTime: initialTime,
        initialPosition: initialPosition,
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
  required double initialTime,
  double? initialPosition,
}) {
  assert(range.first < range.second, 'Range must be in ascending order');
  final random = Random();
  final rangeSize = range.second - range.first;

  Logger.d("Passed initial position: $initialPosition");

  initialPosition ??= range.first + random.nextDouble() * rangeSize;

  Logger.d("Randomized initial position: $initialPosition");
  late final double finalPosition;
  if (initialPosition < range.first + rangeSize / 2) {
    finalPosition = range.second -
        random.nextDouble() * rangeSize / 4; // Valor en el último cuarto
  } else {
    finalPosition = range.first +
        random.nextDouble() * rangeSize / 4; // Valor en el primer cuarto
  }
  final speed = (finalPosition - initialPosition) / secondsDuration;

  final p0 = Number(initialPosition);
  final t = Variable('t');
  final v = Number(speed);
  final expression = p0 + v * (t - Number(initialTime));
  Logger.d('Expression: $expression');
  Logger.d('Initial position: $initialPosition');
  Logger.d('Final position: $finalPosition');
  return expression;
}

Expression generateUniformlyAccelerated({
  required Pair<double, double> range,
  required double secondsDuration,
  required double initialTime,
  double? initialPosition,
}) {
  assert(range.first < range.second, 'Range must be in ascending order');
  final random = Random();
  final rangeSize = range.second - range.first;
  final ableToChangeInitial = initialPosition == null;

  initialPosition ??= range.first + random.nextDouble() * rangeSize;

  late final double finalPosition;
  final positiveAcceleration = random.nextBool();
  bool positiveVelocity = random.nextBool();

  if (initialPosition < range.first + rangeSize / 2) {
    positiveVelocity = true;
  } else {
    positiveVelocity = false;
  }

  double initialVelocity = 0;
  double acceleration = 0;

  if (positiveVelocity && positiveAcceleration) {
    finalPosition = initialPosition +
        (range.second - initialPosition) *
            random
                .nextDouble(); // Random position greater than initial position
    acceleration =
        (finalPosition - initialPosition) * 2 / pow(secondsDuration, 2);
  } else if (!positiveVelocity && !positiveAcceleration) {
    finalPosition = initialPosition -
        (initialPosition - range.first) *
            random.nextDouble(); // Random position less than initial position
    acceleration =
        (finalPosition - initialPosition) * 2 / pow(secondsDuration, 2);
  } else if (!positiveVelocity) {
    initialVelocity = -random.nextDouble() - 2;
    acceleration =
        -2 * initialVelocity / secondsDuration; // Para hacer v=0 en t_f/2
  } else {
    initialVelocity = random.nextDouble() + 2;
    acceleration =
        -2 * initialVelocity / secondsDuration; // Para hacer v=0 en t_f/2
  }

  Logger.d("Initial Velocity: $initialVelocity");
  Logger.d("Acceleration: $acceleration");

  final t = Variable('t') - Number(initialTime);
  final a = Number(acceleration);
  final v0 = Number(initialVelocity);
  final p0 = Number(initialPosition);
  Expression expression = p0 + v0 * (t) + (Number(0.5) * a * t * t);
  final valueAtvO = expression.evaluateAt((initialTime + secondsDuration) / 2);
  if (valueAtvO > range.second && ableToChangeInitial) {
    final difference = valueAtvO - range.second;
    expression = expression - Number(difference);
  } else if (valueAtvO < range.first && ableToChangeInitial) {
    final difference = range.first - valueAtvO;
    expression = expression + Number(difference);
  }

  return expression;
}

List<Expression> generateSectioned({
  required Pair<double, double> range,
  required double secondsDuration,
  required int sections,
}) {
  assert(range.first < range.second, 'Range must be in ascending order');
  assert(sections > 0, 'Sections must be greater than 0');

  final sectionDuration = secondsDuration / sections;
  var initialPosition = range.first; // Randomized in generators

  final expressions = <Expression>[];
  final randomizedTypes = [...GraphTypes.values]..shuffle();

  for (var i = 0; i < sections; i++) {
    final graphType = randomizedTypes[i];
    final expression = generatePositionExpression(
      range: range,
      secondsDuration: sectionDuration,
      type: graphType,
      initialPosition: i != 0 ? initialPosition : null,
      initialTime: i * sectionDuration,
    );
    expressions.add(expression);
    initialPosition = expression.evaluateAt((i + 1) * sectionDuration);
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
          initialTime: 0,
        )
      ];
    case Difficulty.medium:
      return [
        generateUniformlyAccelerated(
          range: range,
          secondsDuration: secondsDuration,
          initialTime: 0,
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
    return result.toDouble();
  }

  double getDistance(List<Pair<double, double>> samples) =>
      sqrt(getDistanceSqr(samples) / samples.length);

  double getDistanceSqr(List<Pair<double, double>> samples) {
    final error = samples.map((sample) {
      final t = sample.first;
      final p = sample.second;
      final result = evaluateAt(t);
      return pow(result - p, 2);
    }).sum();
    return error / samples.length;
  }
}

extension ExpressionListExtensions on List<Expression> {
  double getDistance(List<Pair<double, double>> samples) {
    final secondsDuration = samples.last.first;
    final errors = <double>[];
    forEachIndexed((expression, index) {
      final expressionSamples = samples
          .filter((sample) =>
              sample.first <= (index + 1) * secondsDuration / length)
          .toList();
      errors.add(expression.getDistanceSqr(expressionSamples));
    });
    return sqrt(errors.sum());
  }
}
