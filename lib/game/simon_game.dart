import 'package:dartx/dartx.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/game/screens/level/game_level_screen.dart';
import 'package:imitador/model/level/level.dart';

class SimonGame extends FlameGame with HasKeyboardHandlerComponents {
  Level level;
  void Function(List<Pair<double, double>> samples)
      onFinishedWithResult;
  final spriteOutOfBoundsSize = Constants.trackingSpriteSize / 2;

  SimonGame({
    required this.level,
    required this.onFinishedWithResult,
  });

  @override
  Color backgroundColor() {
    return const Color(0xff202020);
  }

  @override
  Future<void> onLoad() async {
    add(
      GameLevelPage(
        onFinishedWithResult: (samples) {
          onFinishedWithResult(samples);
        },
      ),
    );
  }
}
