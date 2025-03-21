import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide PointerMoveEvent;
import 'package:flutter/services.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/device/microbit_controller.dart';
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
  late RoundedButton _connectButton;
  late RoundedButton _disconnectButton;
  bool finishedSampling = false;
  bool usingMicrobit = false;
  StreamSubscription<double>? _microbitSubscription;
  final MicrobitController _microbitController = MicrobitController();
  void Function(List<Pair<double, double>>) onFinishedWithResult;

  GameLevelPage({
    this.difficulty,
    required this.onFinishedWithResult,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final gameInitialSize = game.size;

    // Initialize microbit controller
    await _microbitController.initialize();

    addAll([
      _graph = GraphComponent(
        fixedExpressions: game.level.expressions,
        onFinishedSampling: finishSampling,
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
        ..position =
            Vector2(gameInitialSize.x / 2 - 80, gameInitialSize.y - 100),
    ]);

    // Add connect button to the component - initially visible
    _connectButton = RoundedButton(
      text: 'Conectar micro:bit',
      action: toggleMicrobit,
      color: const Color(0xff6ca1de),
      borderColor: const Color(0xffabdeff),
    )
      ..anchor = Anchor.centerLeft
      ..position = Vector2(gameInitialSize.x / 2 + 80, gameInitialSize.y - 100);
    add(_connectButton);

    // Create disconnect button but don't add it yet
    _disconnectButton = RoundedButton(
      text: 'Desconectar micro:bit',
      action: toggleMicrobit,
      color: const Color(0xff6ca1de),
      borderColor: const Color(0xffabdeff),
    )
      ..anchor = Anchor.centerLeft
      ..position = Vector2(gameInitialSize.x / 2 + 80, gameInitialSize.y - 100);
    // We'll add this button only when needed
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
    if (!usingMicrobit) {
      final newX = (event.localPosition.x)
          .clamp(_sparky.size.x / 2, game.size.x - _sparky.size.x / 2);
      _sparky.position = Vector2(newX, _sparky.position.y);
      _graph.updateCurrentPosition(toScaledPosition(newX));
    }
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (!usingMicrobit) {
      final newX =
          event.canvasEndPosition.x.clamp(0.0, game.size.x - _sparky.size.x);
      _sparky.position = Vector2(newX, _sparky.position.y);
    }
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

  /// Toggle between using micro:bit and mouse input
  Future<void> toggleMicrobit() async {
    if (usingMicrobit) {
      // Disconnect microbit
      await _microbitController.disconnect();
      _microbitSubscription?.cancel();
      _microbitSubscription = null;
      usingMicrobit = false;

      // Switch buttons
      remove(_disconnectButton);
      add(_connectButton);

      _helperText.text = 'Usando el mouse para controlar';
    } else {
      // Connect to microbit
      final connected = await _microbitController.connect();
      if (connected) {
        usingMicrobit = true;

        // Switch buttons
        remove(_connectButton);
        add(_disconnectButton);

        _helperText.text = 'Usando micro:bit para controlar';

        // Subscribe to microbit data stream
        _microbitSubscription = _microbitController.dataStream.listen((value) {
          // Convert value from 0-1 to screen coordinates
          final screenWidth = game.size.x - _sparky.size.x;
          final newX = (value * screenWidth).clamp(0.0, screenWidth);

          // Update sprite position
          _sparky.position = Vector2(newX, _sparky.position.y);
          _graph.updateCurrentPosition(newX);
        });
      } else {
        _helperText.text = 'Error al conectar con micro:bit';
      }
    }
  }

  @override
  void onRemove() {
    // Clean up resources
    _microbitSubscription?.cancel();
    _microbitController.dispose();
    super.onRemove();
  }
}
