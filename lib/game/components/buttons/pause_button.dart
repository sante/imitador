import 'package:flame/components.dart';
import 'package:imitador/game/components/buttons/simple_button.dart';
import 'package:flutter/rendering.dart';
import 'package:imitador/game/simon_game.dart';

class PauseButton extends SimpleButton with HasGameReference<SimonGame> {
  PauseButton()
      : super(
          Path()
            ..moveTo(14, 10)
            ..lineTo(14, 30)
            ..moveTo(26, 10)
            ..lineTo(26, 30),
          position: Vector2(60, 10),
        );
  @override
  void action() {}
}
