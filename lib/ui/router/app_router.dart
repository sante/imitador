import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/screens/level/level_screen.dart';
import 'package:imitador/ui/screens/level_selector/level_selector_screen.dart';
import 'package:imitador/ui/screens/log_in/log_in_screen.dart';
import 'package:imitador/ui/screens/settings/settings_screen.dart';
import 'package:imitador/ui/screens/sign_up/sign_up_data_screen.dart';
import 'package:imitador/ui/screens/sign_up/sign_up_type_screen.dart';
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
                    page: ResultsRoute.page,
                    path: "results",
                  ),
                ],
              ),
              AutoRoute(
                page: ActivitySectionRoute.page,
                path: "activity",
                children: [
                  AutoRoute(page: LevelSelectorRoute.page, initial: true),
                  AutoRoute(
                    page: LevelRoute.page,
                    path: "level",
                  ),
                  AutoRoute(
                    page: ResultsRoute.page,
                    path: "levelResults",
                  ),
                ],
              ),
            ],
          ),
        ];
}
