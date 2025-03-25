import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/screens/game_session/game_session_lobby_screen.dart';
import 'package:imitador/ui/screens/game_session/game_session_test_screen.dart';
import 'package:imitador/ui/screens/join_session/join_session_screen.dart';
import 'package:imitador/ui/screens/level/level_screen.dart';
import 'package:imitador/ui/screens/level_selector/level_selector_screen.dart';
import 'package:imitador/ui/screens/log_in/log_in_screen.dart';
import 'package:imitador/ui/screens/settings/settings_screen.dart';
import 'package:imitador/ui/screens/sign_up/sign_up_data_screen.dart';
import 'package:imitador/ui/screens/sign_up/sign_up_type_screen.dart';
import 'package:imitador/ui/screens/splash/splash_screen.dart';
import 'package:imitador/ui/section/activity/activity_section.dart';
import 'package:imitador/ui/section/game_session/game_session_section.dart';
import 'package:imitador/ui/section/global/global_section.dart';
import 'package:imitador/ui/section/level/level_section.dart';
import 'package:imitador/ui/screens/welcome/welcome_screen.dart';
import 'package:imitador/ui/screens/results/results_screen.dart';
import 'package:imitador/ui/section/sign_up/sign_up_section.dart';

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
            page: GlobalSectionRoute.page,
            children: [
              AutoRoute(
                path: "splash",
                page: SplashRoute.page,
                initial: true,
              ),
              AutoRoute(
                path: 'welcome',
                page: WelcomeRoute.page,
              ),
              RedirectRoute(
                path: '',
                redirectTo: 'splash',
              ),
              AutoRoute(
                page: LevelSelectorRoute.page,
                path: "levelSelector",
              ),
              AutoRoute(
                page: LogInRoute.page,
                path: "login",
              ),
              AutoRoute(
                page: SettingsRoute.page,
                path: "settings",
              ),
              AutoRoute(
                page: SignUpSectionRoute.page,
                path: "signUp",
                children: [
                  AutoRoute(
                    page: SignUpTypeRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    page: SignUpDataRoute.page,
                  ),
                ],
              ),
              AutoRoute(
                page: LevelSectionRoute.page,
                path: "level",
                children: [
                  AutoRoute(
                    page: LevelRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    page: LevelResultsRoute.page,
                    path: "results",
                  ),
                ],
              ),
              AutoRoute(
                path: "activity/:id",
                usesPathAsKey: true,
                page: ActivitySectionRoute.page,
                children: [
                  AutoRoute(
                    page: ActivityLevelSelectorRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    page: ActivityLevelRoute.page,
                    path: "level",
                  ),
                  AutoRoute(
                    page: ActivityResultsRoute.page,
                    path: "levelResults",
                  ),
                ],
              ),
              AutoRoute(
                page: JoinSessionRoute.page,
                path: "joinSession",
              ),
              AutoRoute(
                page: GameSessionSectionRoute.page,
                path: "gameSession",
                children: [
                  AutoRoute(
                    page: GameSessionLobbyRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    page: GameSessionTestRoute.page,
                    path: "test",
                  )
                ],
              ),
            ],
          ),
        ];
}
