import 'package:flame/game.dart';
import 'package:imitador/game/screens/level/game_level_screen.dart';

class SimonRouter extends RouterComponent {
  SimonRouter()
      : super(
          routes: {
            'level': Route(GameLevelPage.new),
          },
          initialRoute: 'level',
        );
}
