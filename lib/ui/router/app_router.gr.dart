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
    ActivitySectionRoute.name: (routeData) {
      final args = routeData.argsAs<ActivitySectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivitySectionRouter(
          activity: args.activity,
          key: args.key,
        ),
      );
    },
    GameSessionSectionRoute.name: (routeData) {
      final args = routeData.argsAs<GameSessionSectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameSessionSectionRouter(
          session: args.session,
          key: args.key,
        ),
      );
    },
    GlobalSectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GlobalSectionRouter(),
      );
    },
    LevelRoute.name: (routeData) {
      final args = routeData.argsAs<LevelRouteArgs>(
          orElse: () => const LevelRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LevelScreen(
          sessionType: args.sessionType,
          key: args.key,
        ),
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
    ResultsRoute.name: (routeData) {
      final args = routeData.argsAs<ResultsRouteArgs>(
          orElse: () => const ResultsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultsScreen(
          sessionType: args.sessionType,
          key: args.key,
        ),
      );
    },
    SessionLevelSelectorRoute.name: (routeData) {
      final args = routeData.argsAs<SessionLevelSelectorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SessionLevelSelectorScreen(
          sessionType: args.sessionType,
          key: args.key,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
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
/// [ActivitySectionRouter]
class ActivitySectionRoute extends PageRouteInfo<ActivitySectionRouteArgs> {
  ActivitySectionRoute({
    required Activity activity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ActivitySectionRoute.name,
          args: ActivitySectionRouteArgs(
            activity: activity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ActivitySectionRoute';

  static const PageInfo<ActivitySectionRouteArgs> page =
      PageInfo<ActivitySectionRouteArgs>(name);
}

class ActivitySectionRouteArgs {
  const ActivitySectionRouteArgs({
    required this.activity,
    this.key,
  });

  final Activity activity;

  final Key? key;

  @override
  String toString() {
    return 'ActivitySectionRouteArgs{activity: $activity, key: $key}';
  }
}

/// generated route for
/// [GameSessionSectionRouter]
class GameSessionSectionRoute
    extends PageRouteInfo<GameSessionSectionRouteArgs> {
  GameSessionSectionRoute({
    required GameSession session,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GameSessionSectionRoute.name,
          args: GameSessionSectionRouteArgs(
            session: session,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GameSessionSectionRoute';

  static const PageInfo<GameSessionSectionRouteArgs> page =
      PageInfo<GameSessionSectionRouteArgs>(name);
}

class GameSessionSectionRouteArgs {
  const GameSessionSectionRouteArgs({
    required this.session,
    this.key,
  });

  final GameSession session;

  final Key? key;

  @override
  String toString() {
    return 'GameSessionSectionRouteArgs{session: $session, key: $key}';
  }
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
/// [LevelScreen]
class LevelRoute extends PageRouteInfo<LevelRouteArgs> {
  LevelRoute({
    PlaySessionType sessionType = PlaySessionType.level,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LevelRoute.name,
          args: LevelRouteArgs(
            sessionType: sessionType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LevelRoute';

  static const PageInfo<LevelRouteArgs> page = PageInfo<LevelRouteArgs>(name);
}

class LevelRouteArgs {
  const LevelRouteArgs({
    this.sessionType = PlaySessionType.level,
    this.key,
  });

  final PlaySessionType sessionType;

  final Key? key;

  @override
  String toString() {
    return 'LevelRouteArgs{sessionType: $sessionType, key: $key}';
  }
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
/// [ResultsScreen]
class ResultsRoute extends PageRouteInfo<ResultsRouteArgs> {
  ResultsRoute({
    PlaySessionType sessionType = PlaySessionType.level,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResultsRoute.name,
          args: ResultsRouteArgs(
            sessionType: sessionType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultsRoute';

  static const PageInfo<ResultsRouteArgs> page =
      PageInfo<ResultsRouteArgs>(name);
}

class ResultsRouteArgs {
  const ResultsRouteArgs({
    this.sessionType = PlaySessionType.level,
    this.key,
  });

  final PlaySessionType sessionType;

  final Key? key;

  @override
  String toString() {
    return 'ResultsRouteArgs{sessionType: $sessionType, key: $key}';
  }
}

/// generated route for
/// [SessionLevelSelectorScreen]
class SessionLevelSelectorRoute
    extends PageRouteInfo<SessionLevelSelectorRouteArgs> {
  SessionLevelSelectorRoute({
    required PlaySessionType sessionType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SessionLevelSelectorRoute.name,
          args: SessionLevelSelectorRouteArgs(
            sessionType: sessionType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionLevelSelectorRoute';

  static const PageInfo<SessionLevelSelectorRouteArgs> page =
      PageInfo<SessionLevelSelectorRouteArgs>(name);
}

class SessionLevelSelectorRouteArgs {
  const SessionLevelSelectorRouteArgs({
    required this.sessionType,
    this.key,
  });

  final PlaySessionType sessionType;

  final Key? key;

  @override
  String toString() {
    return 'SessionLevelSelectorRouteArgs{sessionType: $sessionType, key: $key}';
  }
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
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

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
