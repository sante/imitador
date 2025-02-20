import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:imitador/game/simon_game.dart';

class ScoresPage extends Component with HasGameReference<SimonGame> {
  ScoresPage() {
    addAll([
      _placeholder = TextComponent(
        text: 'Scores',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 64,
            color: Color(0xFFC8FFF5),
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      ),
    ]);
  }

  late final TextComponent _placeholder;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _placeholder.position = Vector2(size.x / 2, size.y / 3);
  }
}
