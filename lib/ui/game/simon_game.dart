import 'package:flame/game.dart';
import 'package:imitador/ui/game/router/simon_router.dart';

class SimonGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(SimonRouter());
  }
}
