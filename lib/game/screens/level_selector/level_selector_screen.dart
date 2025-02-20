import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:imitador/game/components/buttons/back_button.dart';
import 'package:imitador/game/components/buttons/rounded_button.dart';
import 'package:imitador/game/simon_game.dart';

class LevelSelectorPage extends Component with HasGameReference<SimonGame> {
  late final TextComponent _placeholder;
  late final BackButton _backButton;
  late final RoundedButton _randomEasy; // TODO: Add list of available levels
  late final RoundedButton _randomMedium;
  late final RoundedButton _randomHard;

  LevelSelectorPage() {
    addAll([
      _placeholder = TextComponent(
        text: 'Level Selector',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 64,
            color: Color(0xFFC8FFF5),
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      ),
      _backButton = BackButton(),
      _randomEasy = RoundedButton(
        text: 'Random Easy',
        action: () => game.router.pushNamed('level'),
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      ),
      _randomMedium = RoundedButton(
        text: 'Random Medium',
        action: () => game.router.pushNamed('level'),
        color: const Color(0xffdebe6c),
        borderColor: const Color(0xfffff4c7),
      ),
      _randomHard = RoundedButton(
        text: 'Random Hard',
        action: () => game.router.pushNamed('level'),
        color: const Color(0xffde6c6c),
        borderColor: const Color(0xffffc7c7),
      ),
    ]);
  }


  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _placeholder.position = Vector2(size.x / 2, size.y / 3);
    _randomEasy.position = Vector2(size.x / 2, _placeholder.y + 140);
    _randomMedium.position = Vector2(size.x / 2, _placeholder.y + 200);
    _randomHard.position = Vector2(size.x / 2, _placeholder.y + 260);
    _backButton.position = Vector2(0, 0);
  }
}
