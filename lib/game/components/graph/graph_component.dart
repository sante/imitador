import 'dart:async';
import 'dart:ui';

import 'package:dartx/dartx.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/helper/transformer_helper.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/enum/level_type.dart';
import 'package:imitador/model/level_expression/level_expression.dart';
import 'package:imitador/ui/theme/app_text_styles.dart';
import 'package:math_expressions/math_expressions.dart';

const verticalPadding = 0.9;
const horizontalPadding = 0.9;

class GraphComponent extends PositionComponent
    with HasGameReference<SimonGame> {
  final LevelExpressions fixedExpressions;
  final int secondsDuration;
  final VoidCallback? onFinishedSampling;
  final Pair<double, double> distanceRange;
  final List<Pair<double, double>> distances = [];
  List<Pair<double, double>> speeds = [];
  double currentTime = 0;
  double currentPosition = 0;
  bool inCountdown = false;
  bool sampling = false;
  final axisLinePaint = BasicPalette.black.paint()..strokeWidth = 5.r;
  final pointPaint = PaletteEntry(Color(0xffC7EF00)).paint()..strokeWidth = 3.0;
  final objectivePaint = PaletteEntry(Color(0xffA882DD)).paint()
    ..strokeWidth = 3.0;
  final currentTimePaint = PaletteEntry(Color(0xffC7EF00)).paint()
    ..strokeWidth = 2.0;
  final gridPaint = BasicPalette.lightGray.paint()..strokeWidth = 3.0;
  final mathContext = ContextModel();
  late double xAxisYOffset;
  late final double effectiveTimeSize;

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
    effectiveTimeSize =
        (size.x - game.spriteOutOfBoundsSize) * horizontalPadding;

    return super.onLoad();
  }

  void addDataPoint(double distance) {
    if (sampling) {
      distances.add(Pair(currentTime, distance));
      if (game.level.type == LevelType.speed) {
        speeds = deriveSamples(distances, 10);
      }
    }
  }

  void startSampling() {
    sampling = true;
    distances.clear();
  }

  void updateCurrentPosition(double position) {
    currentPosition = position;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawGraph(
      canvas: canvas,
      size: size,
      axisLinePaint: axisLinePaint,
      pointPaint: pointPaint,
      yAxisXOffset: game.spriteOutOfBoundsSize,
      samples: game.level.type == LevelType.position ? distances : speeds,
      secondsDuration: secondsDuration.toDouble(),
      currentValue: currentPosition,
      sampling: sampling,
      fixedExpressions: fixedExpressions,
      effectiveTimeSize: effectiveTimeSize,
      currentTime: currentTime,
      currentTimePaint: currentTimePaint,
      objectivePaint: objectivePaint,
      range: distanceRange,
      mathContext: mathContext,
      fontColor: Colors.black,
      drawGrid: true,
      gridPaint: gridPaint,
      yAxisLabel: switch (game.level.type) {
        LevelType.position => "X(t)",
        LevelType.speed => "V(t)",
      },
    );
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

void drawXTickAt({
  required double value,
  required Canvas canvas,
  required double xAxisYOffset,
  required double yAxisXOffset,
  required Vector2 size,
  required double secondsDuration,
  required double effectiveTimeSize,
  required Paint axisLinePaint,
  required Color fontColor,
  Paint? gridPaint,
  bool drawGrid = false,
}) {
  final x = value * effectiveTimeSize / secondsDuration + yAxisXOffset;
  if (drawGrid) {
    canvas.drawLine(
      Offset(x, size.y * (1 - verticalPadding)),
      Offset(x, size.y),
      gridPaint ?? axisLinePaint,
    );
  }
  canvas.drawLine(
    Offset(x, xAxisYOffset - 5),
    Offset(x, xAxisYOffset + 5),
    axisLinePaint,
  );
  if (x.toInt() != 0) {
    TextSpan span = TextSpan(
      style: handWritingTextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: fontColor,
      ),
      text: value.toInt().toString(),
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, Offset(x - 15, xAxisYOffset + 5));
  }
}

Offset toCanvasCoordinates({
  required Pair<double, double> point,
  required double xAxisYOffset,
  required double verticalPadding,
  required double effectiveTimeSize,
  required double secondsDuration,
  required Pair<double, double> range,
  required Vector2 size,
  required double yAxisXOffset,
}) {
  return Offset(
    point.first * effectiveTimeSize / secondsDuration + yAxisXOffset,
    xAxisYOffset -
        (point.second /
            (range.second - range.first) *
            size.y *
            verticalPadding),
  );
}

void drawTextAt({
  required Canvas canvas,
  required String text,
  required double x,
  required double y,
  required Color color,
  double fontSize = 16,
}) {
  TextSpan span = TextSpan(
    style: handWritingTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
      color: color,
    ),
    text: text,
  );
  TextPainter tp = TextPainter(
    text: span,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );
  tp.layout();
  tp.paint(canvas, Offset(x, y));
}

void drawYTickAt({
  required double value,
  required Canvas canvas,
  required double xAxisYOffset,
  required double yAxisXOffset,
  required Vector2 size,
  required Paint axisLinePaint,
  required Pair<double, double> range,
  required Color fontColor,
  Paint? gridPaint,
  bool drawGrid = false,
}) {
  final y = xAxisYOffset -
      (value / (range.second - range.first) * size.y * verticalPadding);
  if (drawGrid && y != 0) {
    canvas.drawLine(
      Offset(yAxisXOffset, y),
      Offset(size.x, y),
      gridPaint ?? axisLinePaint,
    );
  }
  canvas.drawLine(
    Offset(yAxisXOffset - 5, y),
    Offset(yAxisXOffset + 5, y),
    axisLinePaint,
  );
  if (y.toInt() != 0) {
    drawTextAt(
        canvas: canvas,
        text: value.toInt().toString(),
        x: yAxisXOffset - 30,
        y: y - 10,
        color: fontColor);
  }
}

void drawGraph({
  required Canvas canvas,
  required Vector2 size,
  required Paint axisLinePaint,
  required Paint pointPaint,
  required double yAxisXOffset, // game.spriteOutOfBoundsSize
  required List<Pair<double, double>> samples, // distances
  required double secondsDuration,
  double? currentValue,
  bool sampling = false,
  required List<Expression> fixedExpressions,
  required double effectiveTimeSize,
  double? currentTime,
  Paint? currentTimePaint,
  required Paint objectivePaint,
  required Pair<double, double> range, // distanceRange
  required Color fontColor,
  required ContextModel mathContext,
  bool drawGrid = false,
  Paint? gridPaint,
  required String yAxisLabel,
}) {
  final xAxisYOffset = size.y +
      (range.first / (range.second - range.first)) * size.y * verticalPadding;
  drawYTickAt(
    value: range.second,
    canvas: canvas,
    size: size,
    range: range,
    axisLinePaint: axisLinePaint,
    xAxisYOffset: xAxisYOffset,
    yAxisXOffset: yAxisXOffset,
    fontColor: fontColor,
    drawGrid: drawGrid,
    gridPaint: gridPaint,
  ); // Max y tick
  drawYTickAt(
    value: range.first,
    canvas: canvas,
    size: size,
    range: range,
    axisLinePaint: axisLinePaint,
    xAxisYOffset: xAxisYOffset,
    yAxisXOffset: yAxisXOffset,
    fontColor: fontColor,
    drawGrid: drawGrid,
    gridPaint: gridPaint,
  ); // Min y tick
  // Dibujar los ejes
  canvas.drawLine(
    Offset(yAxisXOffset, xAxisYOffset),
    Offset(size.x, xAxisYOffset),
    axisLinePaint,
  ); // eje x
  canvas.drawLine(
    Offset(yAxisXOffset, 0),
    Offset(yAxisXOffset, size.y),
    axisLinePaint,
  ); // eje y
  // Dibujar flechas
  canvas.drawLine(
    Offset(size.x - 10, xAxisYOffset - 5),
    Offset(size.x, xAxisYOffset),
    axisLinePaint,
  );
  canvas.drawLine(
    Offset(size.x - 10, xAxisYOffset + 5),
    Offset(size.x, xAxisYOffset),
    axisLinePaint,
  );
  canvas.drawLine(
    Offset(yAxisXOffset - 5, 10),
    Offset(yAxisXOffset, 0),
    axisLinePaint,
  );
  canvas.drawLine(
    Offset(yAxisXOffset + 5, 10),
    Offset(yAxisXOffset, 0),
    axisLinePaint,
  );

  // Dibujar etiquetas
  drawTextAt(
    canvas: canvas,
    text: yAxisLabel,
    x: yAxisXOffset - 50,
    y: 15,
    color: fontColor,
  );
  drawTextAt(
    canvas: canvas,
    text: "t",
    x: size.x - 15,
    y: xAxisYOffset + 10,
    color: fontColor,
  );

  for (int i = range.first.ceil(); i <= range.second.floor(); i++) {
    if (i != 0) {
      drawYTickAt(
        value: i.toDouble(),
        canvas: canvas,
        size: size,
        range: range,
        axisLinePaint: axisLinePaint,
        xAxisYOffset: xAxisYOffset,
        yAxisXOffset: yAxisXOffset,
        fontColor: fontColor,
        drawGrid: drawGrid,
        gridPaint: gridPaint,
      );
    }
  }
  for (int i = 1; i <= secondsDuration; i++) {
    drawXTickAt(
      value: i.toDouble(),
      canvas: canvas,
      yAxisXOffset: yAxisXOffset,
      xAxisYOffset: xAxisYOffset,
      secondsDuration: secondsDuration,
      effectiveTimeSize: effectiveTimeSize,
      axisLinePaint: axisLinePaint,
      size: size,
      fontColor: fontColor,
      drawGrid: drawGrid,
      gridPaint: gridPaint,
    );
  }

  // Dibujar las expresiones fijas
  fixedExpressions.forEachIndexed((expression, index) {
    final startTime = index * secondsDuration / fixedExpressions.length;
    final endTime = (index + 1) * secondsDuration / fixedExpressions.length;
    final startPixel =
        (startTime * effectiveTimeSize / secondsDuration + yAxisXOffset)
            .round();
    final endPixel =
        (endTime * effectiveTimeSize / secondsDuration + yAxisXOffset).round();
    final List<Offset> sectionPoints = [];
    for (int i = startPixel; i <= endPixel; i++) {
      mathContext.bindVariable(Variable("t"),
          Number(secondsDuration / effectiveTimeSize * (i - yAxisXOffset)));
      final value = expression.evaluate(EvaluationType.REAL, mathContext);
      final y = xAxisYOffset -
          (value * size.y / (range.second - range.first) * verticalPadding);
      sectionPoints.add(Offset(i.toDouble(), y));
    }
    canvas.drawPoints(PointMode.polygon, sectionPoints, objectivePaint);
  });

  // Dibujar la gráfica de distancia vs tiempo
  if (samples.isNotEmpty) {
    canvas.drawPoints(
        PointMode.polygon,
        samples
            .map((it) => toCanvasCoordinates(
                  point: it,
                  yAxisXOffset: yAxisXOffset,
                  xAxisYOffset: xAxisYOffset,
                  range: range,
                  size: size,
                  secondsDuration: secondsDuration,
                  effectiveTimeSize: effectiveTimeSize,
                  verticalPadding: verticalPadding,
                ))
            .toList(),
        pointPaint);
  }

  if (currentValue != null) {
    // Dibujar posicion actual
    final currentPositionInCanvas = toCanvasCoordinates(
      point: Pair(0, currentValue),
      yAxisXOffset: yAxisXOffset,
      xAxisYOffset: xAxisYOffset,
      range: range,
      size: size,
      secondsDuration: secondsDuration,
      effectiveTimeSize: effectiveTimeSize,
      verticalPadding: verticalPadding,
    ).dy;
    canvas.drawLine(
      Offset(
        yAxisXOffset - 10,
        currentPositionInCanvas,
      ),
      Offset(
        yAxisXOffset + 10,
        currentPositionInCanvas,
      ),
      pointPaint,
    );
  }

  // Dibujar el tiempo actual
  if (sampling && currentTime != null && currentTimePaint != null) {
    canvas.drawLine(
        Offset(currentTime * effectiveTimeSize / secondsDuration + yAxisXOffset,
            0),
        Offset(currentTime * effectiveTimeSize / secondsDuration + yAxisXOffset,
            size.y),
        currentTimePaint);
  }
}
