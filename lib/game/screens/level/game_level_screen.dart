import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide PointerMoveEvent;
import 'package:flutter/services.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/game/components/buttons/rounded_button.dart';
import 'package:imitador/game/components/graph/graph_component.dart';
import 'package:imitador/game/components/sprites/sparky.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/enum/difficulty.dart';

class GameLevelPage extends Component
    with
        HasGameReference<SimonGame>,
        PointerMoveCallbacks,
        TapCallbacks,
        DragCallbacks,
        KeyboardHandler {
  final Difficulty? difficulty;
  late final GraphComponent _graph;
  late final Sparky _sparky;
  late final TextComponent _helperText;
  late final RoundedButton _playButton;
  bool finishedSampling = false;
  void Function(List<Pair<double, double>>) onFinishedWithResult;

  GameLevelPage({
    this.difficulty,
    required this.onFinishedWithResult,
  });

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    super.onLoad();
    final gameInitialSize = game.size;
    addAll([
      _graph = GraphComponent(
        fixedExpressions: game.level.expressions,
        onFinishedSampling: finishSampling,
        secondsDuration: game.level.secondsDuration.toInt(),
        distanceRange: Pair(game.level.minPosition, game.level.maxPosition),
      )
        ..size = Vector2(gameInitialSize.x, gameInitialSize.y / 2)
        ..position = Vector2(0, 0),
      _sparky = Sparky(
        updatePositionCallback: addPositionValue,
      )..position = Vector2(
          gameInitialSize.x / 2, gameInitialSize.y - (gameInitialSize.y / 4)),
      _helperText = TextComponent(
        text: 'Presiona la barra espaciadora para empezar a muestrear',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFC8FFF5),
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      )..position = Vector2(gameInitialSize.x / 2, gameInitialSize.y - 50),
      _playButton = RoundedButton(
        text: 'Jugar',
        action: () {
          _graph.startSampling();
          _helperText.text = 'Muestreando...';
        },
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      )
        ..anchor = Anchor.centerRight
        ..position = Vector2(gameInitialSize.x / 2, gameInitialSize.y - 100),
    ]);
  }

  void addPositionValue(Vector2 position) {
    _graph.addDataPoint(toScaledPosition(position.x));
  }

  double toScaledPosition(double position) {
    return game.level.minPosition +
        (position - game.spriteOutOfBoundsSize) /
            (game.size.x - Constants.trackingSpriteSize) *
            (game.level.maxPosition - game.level.minPosition);
  }

  @override
  void onPointerMove(PointerMoveEvent event) {
    final newX = (event.localPosition.x)
        .clamp(_sparky.size.x / 2, game.size.x - _sparky.size.x / 2);
    _sparky.position = Vector2(newX, _sparky.position.y);
    _graph.updateCurrentPosition(toScaledPosition(newX));
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final newX =
        event.canvasEndPosition.x.clamp(0.0, game.size.x - _sparky.size.x);
    _sparky.position = Vector2(newX, _sparky.position.y);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _graph.size = Vector2(size.x, size.y / 2);
    _graph.position = Vector2(0, 0);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    switch (event.logicalKey) {
      case LogicalKeyboardKey.space:
        _graph.startSampling();
        _helperText.text = 'Muestreando...';
        break;
      case LogicalKeyboardKey.enter:
        if (finishedSampling) {
          onFinishedWithResult(_graph.distances);
        }
        break;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  void finishSampling() {
    _helperText.text =
        'Muestreo finalizado, presiona espacio para comenzar de nuevo o enter para continuar';
    finishedSampling = true;
  }
}
