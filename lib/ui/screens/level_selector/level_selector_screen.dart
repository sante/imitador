import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/user/user.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/cards.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:imitador/core/repository/attempt_repository.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/model/attempt/attempt.dart';

final dummyLevels = [
  Level(
    id: '1',
    name: 'Fácil',
    difficulty: Difficulty.easy,
    secondsDuration: 10,
    minPosition: -10,
    maxPosition: 10,
    positionExpressions: [],
    speedExpressions: [],
  ),
  Level(
    id: '2',
    name: 'Medio',
    difficulty: Difficulty.medium,
    secondsDuration: 10,
    minPosition: -10,
    maxPosition: 10,
    positionExpressions: [],
    speedExpressions: [],
  ),
  Level(
    id: '3',
    name: 'Difícil',
    difficulty: Difficulty.hard,
    secondsDuration: 10,
    minPosition: -10,
    maxPosition: 10,
    positionExpressions: [],
    speedExpressions: [],
  ),
  Level(
    id: '4',
    name: "Se mueve se mueve",
    difficulty: null,
    positionExpressions: [],
    speedExpressions: [],
    secondsDuration: 10,
    minPosition: 0,
    maxPosition: 10,
  ),
];

@RoutePage()
class LevelSelectorScreen extends StatelessWidget {
  const LevelSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GlobalSectionCubit, GlobalSectionState>(
        builder: (context, state) => _LevelSelectorContentScreen(
          levels: [
            Level(
              id: "freeMovement",
              name: "Movimiento Libre (práctica)",
              difficulty: null,
              minPosition: -10,
              maxPosition: 10,
              secondsDuration: 10,
              positionExpressions: [],
              speedExpressions: [],
            ),
            ...state.levels ?? [],
          ],
          user: state.user,
          activities: state.activities ?? [],
        ),
      );
}

@RoutePage()
class ActivityLevelSelectorScreen extends StatelessWidget {
  const ActivityLevelSelectorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActivitySectionCubit, ActivitySectionState>(
        builder: (context, state) => _LevelSelectorContentScreen(
          levels: state.activity?.levels ?? [],
          user: state.user,
          activity: state.activity,
          isLoading: state.isLoading,
          sessionType: PlaySessionType.activity,
        ),
      );
}

@RoutePage()
class SessionLevelSelectorScreen extends StatelessWidget {
  const SessionLevelSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AttemptRepository attemptRepository = DiProvider.get();
    return BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
      builder: (context, state) => StreamBuilder<List<Attempt>?>(
        stream: attemptRepository.getAttempts(),
        builder: (context, snapshot) {
          final allAttempts = snapshot.data ?? [];
          final filteredAttempts = state.gameId == null
              ? []
              : allAttempts
                  .where((a) => a.gameSessionId == state.gameId)
                  .toList();
          return _LevelSelectorContentScreen(
            levels: state.activity?.levels ?? [],
            user: state.user,
            activity: state.activity,
            sessionType: PlaySessionType.gameSession,
            isLoading: state.activity == null,
            attempts: filteredAttempts.cast<Attempt>(),
          );
        },
      ),
    );
  }
}

class _LevelSelectorContentScreen extends StatelessWidget {
  final List<Level> levels;
  final List<Activity> activities;
  final Activity? activity;
  final User? user;
  final bool isLoading;
  final PlaySessionType? sessionType;
  final List<Attempt> attempts;

  const _LevelSelectorContentScreen({
    required this.levels,
    required this.user,
    this.activities = const [],
    this.activity,
    this.isLoading = false,
    this.sessionType,
    this.attempts = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final randomLevels = levels.filter((it) => it.difficulty != null).toList();
    final fixedLevels = levels.filter((it) => it.difficulty == null).toList();
    return MotionScaffold(
      showTitle: false,
      action: () {},
      actionIcon: user != null ? PhosphorIcons.user() : PhosphorIcons.gear(),
      message: "¡Hola, ${user?.name ?? "invitado"}!",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 104.w),
        child: Center(
          child: !isLoading
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 60.h,
                    children: [
                      if (activity != null)
                        Text(
                          activity!.name,
                          style:
                              context.theme.textStyles.headlineLarge!.copyWith(
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 24.h,
                        children: [
                          if (randomLevels.isNotEmpty)
                            Text(
                              'Juegos libres',
                              style: context.theme.textStyles.headlineMedium!
                                  .copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          _LevelCards(
                            levels: randomLevels,
                            sessionType: sessionType,
                            attempts: attempts,
                            user: user,
                          ),
                        ],
                      ),
                      if (fixedLevels.isNotEmpty)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 24.h,
                          children: [
                            Text(
                              'Niveles',
                              style: context.theme.textStyles.headlineMedium!
                                  .copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            _LevelCards(
                              levels: fixedLevels,
                              sessionType: sessionType,
                              attempts: attempts,
                              user: user,
                            ),
                          ],
                        ),
                      if (activity == null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 24.h,
                          children: [
                            Text(
                              'Actividades',
                              style: context.theme.textStyles.headlineMedium!
                                  .copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            _ActivityCards(activities: activities.toList()),
                          ],
                        ),
                    ],
                  ),
                )
              : CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
        ),
      ),
    );
  }
}

class _LevelCards extends StatelessWidget {
  final List<Level> levels;
  final PlaySessionType? sessionType;
  final List<Attempt> attempts;
  final User? user;

  const _LevelCards({
    required this.levels,
    this.sessionType,
    this.attempts = const [],
    this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorRow(
      children: levels.map(
        (it) {
          int? stars;
          if (user != null) {
            final userAttempts = attempts
                .where((a) => a.levelId == it.id && a.playerId == user!.id)
                .toList();
            if (userAttempts.isNotEmpty) {
              stars = userAttempts.map((a) => a.stars).max();
            }
          }
          return LevelCard(
            label: it.name,
            stars: stars,
            onPressed: () {
              switch (sessionType) {
                case PlaySessionType.activity:
                  context.read<ActivitySectionCubit>().setCurrentLevel(it);
                  break;
                case PlaySessionType.gameSession:
                  context.read<GameSessionSectionCubit>().setCurrentLevel(it);
                  break;
                default: //TODO: Add other cases
                  break;
              }
              context.router.push(switch (sessionType) {
                PlaySessionType.activity => const ActivityLevelRoute(),
                PlaySessionType.gameSession =>
                  const SessionActivityLevelRoute(),
                _ =>
                  LevelSectionRoute(level: it), // TODO: Add other navigations
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class _ActivityCards extends StatelessWidget {
  final List<Activity> activities;

  const _ActivityCards({
    required this.activities,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorRow(
      children: activities
          .map(
            (it) => ActivityCard(
              activity: it,
              onPressed: () {
                context.router.push(ActivitySectionRoute(activityId: it.id));
              },
            ),
          )
          .toList(),
    );
  }
}

class _SelectorRow extends StatelessWidget {
  final List<Widget> children;

  const _SelectorRow({required this.children, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: context.theme.dimensions.spacing24.w,
          runSpacing: context.theme.dimensions.spacing24.h,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: children,
        ),
      );
}
