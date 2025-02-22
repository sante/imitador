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
    LevelRoute.name: (routeData) {
      final args = routeData.argsAs<LevelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LevelScreen(
          level: args.level,
          onFinishedWithResult: args.onFinishedWithResult,
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResultsScreen(),
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
    UnauthenticatedSectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedSectionRouter(),
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
/// [LevelScreen]
class LevelRoute extends PageRouteInfo<LevelRouteArgs> {
  LevelRoute({
    required Level level,
    required void Function(Pair<double, double>) onFinishedWithResult,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LevelRoute.name,
          args: LevelRouteArgs(
            level: level,
            onFinishedWithResult: onFinishedWithResult,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LevelRoute';

  static const PageInfo<LevelRouteArgs> page = PageInfo<LevelRouteArgs>(name);
}

class LevelRouteArgs {
  const LevelRouteArgs({
    required this.level,
    required this.onFinishedWithResult,
    this.key,
  });

  final Level level;

  final void Function(Pair<double, double>) onFinishedWithResult;

  final Key? key;

  @override
  String toString() {
    return 'LevelRouteArgs{level: $level, onFinishedWithResult: $onFinishedWithResult, key: $key}';
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
class ResultsRoute extends PageRouteInfo<void> {
  const ResultsRoute({List<PageRouteInfo>? children})
      : super(
          ResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultsRoute';

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
/// [UnauthenticatedSectionRouter]
class UnauthenticatedSectionRoute extends PageRouteInfo<void> {
  const UnauthenticatedSectionRoute({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedSectionRoute';

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
