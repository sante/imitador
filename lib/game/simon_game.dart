import 'package:dartx/dartx.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/game/router/simon_router.dart';
import 'package:imitador/game/screens/level/game_level_screen.dart';
import 'package:imitador/model/level/level.dart';

class SimonGame extends FlameGame with HasKeyboardHandlerComponents {
  Level level;
  late final SimonRouter router;
  final spriteOutOfBoundsSize = Constants.trackingSpriteSize / 2;

  SimonGame({required this.level});

  @override
  Future<void> onLoad() async {
    router = SimonRouter();
    level = level.copyWith(
      expressions: level.expressions ??
          generateByDifficulty(
            range: Pair(0, 10),
            secondsDuration: 10,
            difficulty: (level as RandomLevel).difficulty,
          ),
    );
    add(GameLevelPage());
  }
}
