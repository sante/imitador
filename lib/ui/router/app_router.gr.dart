// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityLevelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityLevelScreen(),
      );
    },
    ActivityLevelSelectorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityLevelSelectorScreen(),
      );
    },
    ActivityResultsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityResultsScreen(),
      );
    },
    ActivitySectionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ActivitySectionRouteArgs>(
          orElse: () =>
              ActivitySectionRouteArgs(activityId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivitySectionRouter(
          activityId: args.activityId,
          key: args.key,
        ),
      );
    },
    GameSessionLobbyRoute.name: (routeData) {
      final args = routeData.argsAs<GameSessionLobbyRouteArgs>(
          orElse: () => const GameSessionLobbyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameSessionLobbyScreen(key: args.key),
      );
    },
    GameSessionSectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameSessionSectionRouter(),
      );
    },
    GameSessionTestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameSessionTestScreen(),
      );
    },
    GlobalSectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GlobalSectionRouter(),
      );
    },
    JoinSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinSessionScreen(),
      );
    },
    LevelResultsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelResultsScreen(),
      );
    },
    LevelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelScreen(),
      );
    },
    LevelSectionRoute.name: (routeData) {
      final args = routeData.argsAs<LevelSectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LevelSectionRouter(
          level: args.level,
          key: args.key,
        ),
      );
    },
    LevelSelectorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelSelectorScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogInScreen(),
      );
    },
    SessionLevelSelectorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SessionLevelSelectorScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignUpDataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpDataScreen(),
      );
    },
    SignUpSectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpSectionRouter(),
      );
    },
    SignUpTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpTypeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [ActivityLevelScreen]
class ActivityLevelRoute extends PageRouteInfo<void> {
  const ActivityLevelRoute({List<PageRouteInfo>? children})
      : super(
          ActivityLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityLevelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ActivityLevelSelectorScreen]
class ActivityLevelSelectorRoute extends PageRouteInfo<void> {
  const ActivityLevelSelectorRoute({List<PageRouteInfo>? children})
      : super(
          ActivityLevelSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityLevelSelectorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ActivityResultsScreen]
class ActivityResultsRoute extends PageRouteInfo<void> {
  const ActivityResultsRoute({List<PageRouteInfo>? children})
      : super(
          ActivityResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityResultsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ActivitySectionRouter]
class ActivitySectionRoute extends PageRouteInfo<ActivitySectionRouteArgs> {
  ActivitySectionRoute({
    String? activityId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ActivitySectionRoute.name,
          args: ActivitySectionRouteArgs(
            activityId: activityId,
            key: key,
          ),
          rawPathParams: {'id': activityId},
          initialChildren: children,
        );

  static const String name = 'ActivitySectionRoute';

  static const PageInfo<ActivitySectionRouteArgs> page =
      PageInfo<ActivitySectionRouteArgs>(name);
}

class ActivitySectionRouteArgs {
  const ActivitySectionRouteArgs({
    this.activityId,
    this.key,
  });

  final String? activityId;

  final Key? key;

  @override
  String toString() {
    return 'ActivitySectionRouteArgs{activityId: $activityId, key: $key}';
  }
}

/// generated route for
/// [GameSessionLobbyScreen]
class GameSessionLobbyRoute extends PageRouteInfo<GameSessionLobbyRouteArgs> {
  GameSessionLobbyRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GameSessionLobbyRoute.name,
          args: GameSessionLobbyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GameSessionLobbyRoute';

  static const PageInfo<GameSessionLobbyRouteArgs> page =
      PageInfo<GameSessionLobbyRouteArgs>(name);
}

class GameSessionLobbyRouteArgs {
  const GameSessionLobbyRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'GameSessionLobbyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GameSessionSectionRouter]
class GameSessionSectionRoute extends PageRouteInfo<void> {
  const GameSessionSectionRoute({List<PageRouteInfo>? children})
      : super(
          GameSessionSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameSessionSectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameSessionTestScreen]
class GameSessionTestRoute extends PageRouteInfo<void> {
  const GameSessionTestRoute({List<PageRouteInfo>? children})
      : super(
          GameSessionTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameSessionTestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GlobalSectionRouter]
class GlobalSectionRoute extends PageRouteInfo<void> {
  const GlobalSectionRoute({List<PageRouteInfo>? children})
      : super(
          GlobalSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'GlobalSectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinSessionScreen]
class JoinSessionRoute extends PageRouteInfo<void> {
  const JoinSessionRoute({List<PageRouteInfo>? children})
      : super(
          JoinSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LevelResultsScreen]
class LevelResultsRoute extends PageRouteInfo<void> {
  const LevelResultsRoute({List<PageRouteInfo>? children})
      : super(
          LevelResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelResultsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LevelScreen]
class LevelRoute extends PageRouteInfo<void> {
  const LevelRoute({List<PageRouteInfo>? children})
      : super(
          LevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LevelSectionRouter]
class LevelSectionRoute extends PageRouteInfo<LevelSectionRouteArgs> {
  LevelSectionRoute({
    required Level level,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LevelSectionRoute.name,
          args: LevelSectionRouteArgs(
            level: level,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LevelSectionRoute';

  static const PageInfo<LevelSectionRouteArgs> page =
      PageInfo<LevelSectionRouteArgs>(name);
}

class LevelSectionRouteArgs {
  const LevelSectionRouteArgs({
    required this.level,
    this.key,
  });

  final Level level;

  final Key? key;

  @override
  String toString() {
    return 'LevelSectionRouteArgs{level: $level, key: $key}';
  }
}

/// generated route for
/// [LevelSelectorScreen]
class LevelSelectorRoute extends PageRouteInfo<void> {
  const LevelSelectorRoute({List<PageRouteInfo>? children})
      : super(
          LevelSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelSelectorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInScreen]
class LogInRoute extends PageRouteInfo<void> {
  const LogInRoute({List<PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SessionLevelSelectorScreen]
class SessionLevelSelectorRoute extends PageRouteInfo<void> {
  const SessionLevelSelectorRoute({List<PageRouteInfo>? children})
      : super(
          SessionLevelSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionLevelSelectorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpDataScreen]
class SignUpDataRoute extends PageRouteInfo<void> {
  const SignUpDataRoute({List<PageRouteInfo>? children})
      : super(
          SignUpDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpDataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpSectionRouter]
class SignUpSectionRoute extends PageRouteInfo<void> {
  const SignUpSectionRoute({List<PageRouteInfo>? children})
      : super(
          SignUpSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpSectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpTypeScreen]
class SignUpTypeRoute extends PageRouteInfo<void> {
  const SignUpTypeRoute({List<PageRouteInfo>? children})
      : super(
          SignUpTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
