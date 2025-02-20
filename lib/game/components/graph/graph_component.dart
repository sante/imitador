import 'dart:async';
import 'dart:ui';

import 'package:dartx/dartx.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/level_expression/level_expression.dart';
import 'package:math_expressions/math_expressions.dart';

class GraphComponent extends PositionComponent
    with HasGameReference<SimonGame> {
  final LevelExpressions fixedExpressions;
  final int secondsDuration;
  final VoidCallback? onFinishedSampling;
  final Pair<double, double> distanceRange;
  final List<Pair<double, double>> distances = [];
  double currentTime = 0;
  double currentPosition = 0;
  bool inCountdown = false;
  bool sampling = false;
  final axisLinePaint = BasicPalette.white.paint()..strokeWidth = 2.0;
  final linePaint = BasicPalette.red.paint()..strokeWidth = 1.0;
  final pointPaint = BasicPalette.blue.paint()..strokeWidth = 3.0;
  final objectivePaint = BasicPalette.green.paint()..strokeWidth = 3.0;
  final currentTimePaint = BasicPalette.gray.paint()..strokeWidth = 3.0;
  final mathContext = ContextModel();
  late final double effectiveTimeSize;
  final verticalPadding = 0.9;

  GraphComponent({
    required this.fixedExpressions,
    this.secondsDuration = 10,
    this.distanceRange = const Pair(0, 10),
    this.onFinishedSampling,
  });

  @override
  FutureOr<void> onLoad() {
    Logger.d('Game width: ${game.size.x}');
    Logger.d("Canvas height: ${size.y}");
    effectiveTimeSize = size.x - game.spriteOutOfBoundsSize;
    return super.onLoad();
  }

  void addDataPoint(double distance) {
    if (sampling) {
      distances.add(Pair(currentTime, distance));
    }
  }

  void startSampling() {
    sampling = true;
    distances.clear();
  }

  void updateCurrentPosition(double position) {
    currentPosition = position;
  }

  Offset toCanvasCoordinates(Pair<double, double> point) {
    return Offset(
      point.first * effectiveTimeSize / secondsDuration +
          game.spriteOutOfBoundsSize,
      size.y - (point.second * size.y) * verticalPadding,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Dibujar los ejes
    canvas.drawLine(
      Offset(0, size.y),
      Offset(size.x, size.y),
      axisLinePaint,
    ); // eje x
    canvas.drawLine(
      Offset(game.spriteOutOfBoundsSize, 0),
      Offset(game.spriteOutOfBoundsSize, size.y),
      axisLinePaint,
    ); // eje y
    canvas.drawLine(
      Offset(
          game.spriteOutOfBoundsSize - 10, size.y - size.y * verticalPadding),
      Offset(
          game.spriteOutOfBoundsSize + 10, size.y - size.y * verticalPadding),
      axisLinePaint,
    ); // Max y tick

    // Dibujar las expresiones fijas
    fixedExpressions.forEachIndexed((expression, index) {
      final startTime = index * secondsDuration / fixedExpressions.length;
      final endTime = (index + 1) * secondsDuration / fixedExpressions.length;
      final startPixel = (startTime * effectiveTimeSize / secondsDuration +
              game.spriteOutOfBoundsSize)
          .round();
      final endPixel = (endTime * effectiveTimeSize / secondsDuration +
              game.spriteOutOfBoundsSize)
          .round();
      final List<Offset> sectionPoints = [];
      for (int i = startPixel; i <= endPixel; i++) {
        mathContext.bindVariable(
            Variable("t"),
            Number(secondsDuration /
                effectiveTimeSize *
                (i - game.spriteOutOfBoundsSize)));
        final value = expression.evaluate(EvaluationType.REAL, mathContext);
        final y = size.y -
            (value *
                size.y /
                (distanceRange.second - distanceRange.first) *
                verticalPadding);
        sectionPoints.add(Offset(i.toDouble(), y));
      }
      canvas.drawPoints(PointMode.polygon, sectionPoints, objectivePaint);
    });

    // Dibujar la gráfica de distancia vs tiempo
    if (distances.isNotEmpty) {
      canvas.drawPoints(PointMode.polygon,
          distances.map((it) => toCanvasCoordinates(it)).toList(), pointPaint);
    }

    // Dibujar posicion actual
    final currentPositionInCanvas =
        toCanvasCoordinates(Pair(0, currentPosition)).dy;
    canvas.drawLine(
      Offset(
        game.spriteOutOfBoundsSize - 10,
        currentPositionInCanvas,
      ),
      Offset(
        game.spriteOutOfBoundsSize + 10,
        currentPositionInCanvas,
      ),
      pointPaint,
    );

    // Dibujar el tiempo actual
    if (sampling) {
      canvas.drawLine(
          Offset(
              currentTime * effectiveTimeSize / secondsDuration +
                  game.spriteOutOfBoundsSize,
              0),
          Offset(
              currentTime * effectiveTimeSize / secondsDuration +
                  game.spriteOutOfBoundsSize,
              size.y),
          currentTimePaint);
    }
  }

  @override
  void update(double dt) {
    currentPosition = currentPosition;
    if (sampling) {
      currentTime += dt;
      if (currentTime >= secondsDuration) {
        sampling = false;
        currentTime = 0;
        onFinishedSampling?.call();
      }
    }
    super.update(dt);
  }
}
