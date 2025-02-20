import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/screens/level/level_screen.dart';
import 'package:imitador/ui/screens/level_selector/level_selector_screen.dart';
import 'package:imitador/ui/screens/log_in/log_in_screen.dart';
import 'package:imitador/ui/screens/settings/settings_screen.dart';
import 'package:imitador/ui/screens/sign_up/sign_up_screen.dart';
import 'package:imitador/ui/section/section_router.dart';
import 'package:imitador/ui/screens/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes;

  ReevaluateListenable authReevaluateListenable;

  AppRouter(SessionRepository sessionRepository)
      : authReevaluateListenable = ReevaluateListenable.stream(
          sessionRepository.status.distinct().skip(1),
        ),
        routes = [
          AutoRoute(
            path: '/',
            page: UnauthenticatedSectionRoute.page,
            children: [
              AutoRoute(
                path: 'welcome',
                page: WelcomeRoute.page,
                initial: true,
              ),
              RedirectRoute(
                path: '',
                redirectTo: 'welcome',
              ),
              AutoRoute(
                page: LevelSelectorRoute.page,
                path: "levelSelector",
              ),
              AutoRoute(
                page: LevelRoute.page,
                path: "level",
              ),
              AutoRoute(
                page: LogInRoute.page,
                path: "login",
              ),
              AutoRoute(
                page: SettingsRoute.page,
                path: "settings",
              ),
            ],
          ),
        ];
}
