import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:imitador/game/components/buttons/rounded_button.dart';
import 'package:imitador/game/simon_game.dart';

class HomePage extends Component with HasGameReference<SimonGame> {
  late final TextComponent _title;
  late final RoundedButton _playButton;
  late final RoundedButton _settingsButton;

  HomePage() {
    _title = TextComponent(
      text: 'Dr. Simón Dice',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 64,
          color: Color(0xFFC8FFF5),
          fontWeight: FontWeight.w800,
        ),
      ),
      anchor: Anchor.center,
    );

    _playButton = RoundedButton(
      text: 'Jugar',
      action: () => game.router.pushNamed('levelSelector'),
      color: const Color(0xffadde6c),
      borderColor: const Color(0xffedffab),
    );

    _settingsButton = RoundedButton(
      text: 'Configuración',
      action: () async {
      },
      color: const Color(0xffdebe6c),
      borderColor: const Color(0xfffff4c7),
    );

    addAll([
      _title,
      _playButton,
      _settingsButton,
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _title.position = Vector2(size.x / 2, size.y / 3);
    _playButton.position = Vector2(size.x / 2, _title.y + 80);
    _settingsButton.position = Vector2(size.x / 2, _title.y + 140);
  }
}
