import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart' hide PointerMoveEvent;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/device/microbit_controller.dart';
import 'package:imitador/game/components/buttons/rounded_button.dart';
import 'package:imitador/game/components/graph/graph_component.dart';
import 'package:imitador/game/components/ruler.dart';
import 'package:imitador/game/components/sprites/paper_ball.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/enum/level_type.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:math_expressions/math_expressions.dart';

class GameLevelPage extends Component
    with
        HasGameReference<SimonGame>,
        PointerMoveCallbacks,
        TapCallbacks,
        DragCallbacks,
        KeyboardHandler,
        FlameBlocListenable<GlobalSectionCubit, GlobalSectionState> {
  final Difficulty? difficulty;
  late final GraphComponent _graph;
  late final PaperBall _paperBall;
  late final SpriteComponent _notebook;
  late final SpriteComponent _pencil;
  late final SpriteComponent _sharpener;
  late final SpriteComponent _spacebarHint;
  late final RulerComponent _ruler;
  bool finishedSampling = false;
  bool usingMicrobit = false;
  StreamSubscription<double>? _microbitSubscription;
  final MicrobitController _microbitController = MicrobitController();
  void Function(List<Pair<double, double>>) onFinishedWithResult;

  GameLevelPage({
    this.difficulty,
    required this.onFinishedWithResult,
  });

  void handleMicrobitUpdate(GlobalSectionState state) {
    Logger.d('GameLevelPage.onNewState: ${state.usingMicrobit}');
    usingMicrobit = state.usingMicrobit;
    if (usingMicrobit) {
      _microbitSubscription =
          state.microbitController.dataStream.listen(onMicrobitData);
      _graph.averageSamples = true;
    } else {
      _microbitSubscription?.cancel();
      _microbitSubscription = null;
    }
  }

  @override
  void onInitialState(GlobalSectionState state) {
    super.onInitialState(state);
    handleMicrobitUpdate(state);
  }

  @override
  void onNewState(GlobalSectionState state) {
    super.onNewState(state);
    handleMicrobitUpdate(state);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final gameInitialSize = game.size;

    // Initialize microbit controller
    await _microbitController.initialize();
    final notebookImage = await Sprite.load("notebook.png");
    final notebookHeight = gameInitialSize.y * 0.72;
    final notebookWidth = gameInitialSize.x - 140.w;

    addAll([
      _notebook = SpriteComponent(
          sprite: notebookImage,
          size: Vector2(notebookWidth, notebookHeight),
          anchor: Anchor.topLeft,
          position: Vector2(70.w, 14.h),
          children: [
            _graph = GraphComponent(
              fixedExpressions: (game.level.type == LevelType.position
                      ? game.level.positionExpressions
                      : game.level.speedExpressions)
                  .map((it) => Parser().parse(it))
                  .toList(),
              onFinishedSampling: finishSampling,
              secondsDuration: game.level.secondsDuration.toInt(),
              distanceRange:
                  Pair(game.level.minPosition, game.level.maxPosition),
              averageSamples: usingMicrobit,
            )
              ..size = Vector2(notebookWidth - 80.w, 600.h)
              ..position = Vector2(10.w, 70.h)
              ..anchor = Anchor.topLeft
          ]),
      _pencil = SpriteComponent(
        sprite: await Sprite.load('pencil.png'),
        size: Vector2(26.w, 623.h),
        anchor: Anchor.topLeft,
        position: Vector2(24.w, 183.h),
      ),
      _sharpener = SpriteComponent(
        sprite: await Sprite.load('sharpener.png'),
        anchor: Anchor.topCenter,
        position: Vector2(40.w, 821.h),
      ),
      _spacebarHint = SpriteComponent(
        sprite: await Sprite.load('space_bar_message.png'),
        anchor: Anchor.topLeft,
        position: Vector2(490.w, 82.h),
      ),
      _ruler = RulerComponent(
        size: Vector2(
            gameInitialSize.x - (game.spriteOutOfBoundsSize - 10.w), 90.h),
        position:
            Vector2((game.spriteOutOfBoundsSize / 2) - 5.w, gameInitialSize.y),
        anchor: Anchor.bottomLeft,
        minDistance: game.level.minPosition,
        maxDistance: game.level.maxPosition,
        padding: game.spriteOutOfBoundsSize / 2,
      ),
      _paperBall = PaperBall(
        updatePositionCallback: addPositionValue,
      )
        ..position = Vector2(gameInitialSize.x / 2, gameInitialSize.y - 70.h)
        ..anchor = Anchor.bottomCenter,
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
    if (!usingMicrobit) {
      final newX = (event.localPosition.x)
          .clamp(_paperBall.size.x / 2, game.size.x - _paperBall.size.x / 2);
      _paperBall.position = Vector2(newX, _paperBall.position.y);
      _graph.updateCurrentPosition(toScaledPosition(newX));
    }
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (!usingMicrobit) {
      final newX =
          event.canvasEndPosition.x.clamp(0.0, game.size.x - _paperBall.size.x);
      _paperBall.position = Vector2(newX, _paperBall.position.y);
    }
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    switch (event.logicalKey) {
      case LogicalKeyboardKey.space:
        remove(_spacebarHint);
        _graph.startSampling();
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
    add(_spacebarHint);
    finishedSampling = true;
    if (game.level.id != "freeMovement") {
      switch (game.level.type) {
        case LevelType.position:
          onFinishedWithResult(_graph.distances);
          break;
        case LevelType.speed:
          onFinishedWithResult(_graph.speeds);
          break;
      }
    }
  }

  void onMicrobitData(value) {
    // Convert value from 0-1 to screen coordinates
    final screenWidth = game.size.x - _paperBall.size.x / 2;
    final newX = (value * screenWidth)
        .clamp(_paperBall.size.x / 2, game.size.x - _paperBall.size.x / 2);

    // Update sprite position
    _paperBall.position = Vector2(newX, _paperBall.position.y);
    _graph.updateCurrentPosition(newX);
  }

  @override
  void onRemove() {
    // Clean up resources
    _microbitSubscription?.cancel();
    _microbitController.dispose();
    super.onRemove();
  }
}
