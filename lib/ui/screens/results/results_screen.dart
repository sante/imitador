import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';

@RoutePage()
class LevelResultsScreen extends StatelessWidget {
  const LevelResultsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LevelSectionCubit, LevelSectionState>(
        builder: (context, state) =>
            _ResultsContentScreen(
              attempt: state.attempts.last,
            ),
      );
}

@RoutePage()
class ActivityResultsScreen extends StatelessWidget {
  const ActivityResultsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActivitySectionCubit, ActivitySectionState>(
        builder: (context, state) {
          if (state.activity == null || state.currentLevel == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final levelIndex = state.activity?.levels.indexOf(
            state.currentLevel!,);
          final isLastLevel = levelIndex == state.activity!.levels.length - 1;
          return _ResultsContentScreen(
            attempt: state.attempts.last,
            canSelectLevel: true,
            sessionType: PlaySessionType.activity,
            onNextLevel: !isLastLevel ? () {
              context.read<ActivitySectionCubit>().setCurrentLevel(
                  state.activity!.levels[levelIndex! + 1]);
              context.router.replace(const ActivityLevelRoute());
            } : null,
          );
        },
      );
}

class _ResultsContentScreen extends StatelessWidget {
  final Attempt attempt;
  final bool canSelectLevel;
  final PlaySessionType sessionType;
  final void Function()? onNextLevel;

  const _ResultsContentScreen({
    required this.attempt,
    this.canSelectLevel = false,
    this.sessionType = PlaySessionType.level,
    this.onNextLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.h,
          children: [
            const Text("Distancia"),
            Text(attempt.score.toString()),
            const Text("Puntaje"),
            Text(attempt.stars.toString()),
            ElevatedButton(
              onPressed: () {
                context.replaceRoute(switch (sessionType) {
                  PlaySessionType.activity => const ActivityLevelRoute(),
                  PlaySessionType.level => const LevelRoute(),
                // TODO: Handle this case.
                  _ => throw UnimplementedError(),
                });
              },
              child: const Text("Reintentar"),
            ),
            if (onNextLevel != null)
              ElevatedButton(
                onPressed: onNextLevel,
                child: const Text("Siguiente nivel"),
              ),
            if (canSelectLevel)
              ElevatedButton(
                onPressed: () {
                  context.router.navigate(switch (sessionType) {
                    PlaySessionType.activity =>
                    const ActivityLevelSelectorRoute(),
                  // TODO: Handle this case.
                    _ => throw UnimplementedError(),
                  });
                },
                child: const Text("Elegir otro nivel"),
              ),
          ],
        ),
      ),
    );
  }
}
