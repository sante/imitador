import 'package:flame/game.dart';
import 'package:imitador/ui/game/router/pages/home_route.dart';

class SimonRouter extends RouterComponent {
  SimonRouter()
      : super(
          routes: {
            'home': HomeRoute(),
          },
          initialRoute: 'home',
        );
}

sealed class SimonRoute extends Route {
  SimonRoute(super.builder);
}

class HomeRoute extends SimonRoute {
  HomeRoute() : super(HomePage.new);
}
