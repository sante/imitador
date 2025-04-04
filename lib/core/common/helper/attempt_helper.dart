import 'package:dartx/dartx.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/enum/interface_type.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';
import 'package:math_expressions/math_expressions.dart';

Attempt attemptFromSamples({
  required List<Pair<double, double>> samples,
  required Level level,
  required User? player,
}) {
  final expressions =
      level.positionExpressions.map((it) => Parser().parse(it)).toList();
  final distance = expressions.getDistance(samples);
  final score = distance;
  final stars = getScore(score);
  final attempt = Attempt(
    score: score.round(),
    stars: stars,
    plotPointsX: samples.map((it) => it.first).toList(),
    plotPointsY: samples.map((it) => it.second).toList(),
    interfaceType: InterfaceType.mouse,
    // TODO: change to actual interface
    expressions: level.positionExpressions,
    levelId: level.id,
    level: level,
    playerId: player?.id,
  );
  return attempt;
}

int getScore(double distance) => switch (distance) {
// TODO figure out points partition
      < 1.5 => 4,
      < 3.5 => 3,
      < 6 => 2,
      < 10 => 1,
      _ => 0,
    };
