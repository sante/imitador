import 'package:dartx/dartx.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/game/screens/level/game_level_screen.dart';
import 'package:imitador/model/level/level.dart';

class SimonGame extends FlameGame with HasKeyboardHandlerComponents {
  Level level;
  void Function(List<Pair<double, double>>, Level)
      onFinishedWithResult;
  final spriteOutOfBoundsSize = Constants.trackingSpriteSize / 2;

  SimonGame({
    required this.level,
    required this.onFinishedWithResult,
  });

  @override
  Future<void> onLoad() async {
    level = level.copyWith(
      expressions: level.expressions ??
          generateByDifficulty(
            range: level.range,
            secondsDuration: level.secondsDuration,
            difficulty: (level as RandomLevel).difficulty,
          ),
    );
    add(
      GameLevelPage(
        onFinishedWithResult: (samples) {
          onFinishedWithResult(samples, level);
        },
      ),
    );
  }
}
