import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/enum/interface_type.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';
import 'package:math_expressions/math_expressions.dart';

const maxScore = 1000;

Attempt attemptFromSamples({
  required List<Pair<double, double>> samples,
  required Level level,
  required User? player,
}) {
  final expressions =
      level.positionExpressions.map((it) => Parser().parse(it)).toList();
  final distance = expressions.getDistance(samples);
  Logger.d("Distance from samples: $distance");
  final score = maxScore -
      (distance /
              sqrt(((level.maxPosition - level.minPosition) / 2).abs()) *
              maxScore)
          .round();
  final stars = getStars(score);
  final attempt = Attempt(
    score: score < 0 ? 0 : score.round(),
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

int getStars(int score) => switch (score) {
// TODO figure out points partition
      < 200 => 0,
      < 350 => 1,
      < 600 => 2,
      < 800 => 3,
      < 900 => 4,
      _ => 5,
    };
