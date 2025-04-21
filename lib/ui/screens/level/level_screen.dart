import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';

@RoutePage()
class LevelScreen extends StatelessWidget {
  const LevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LevelSectionCubit, LevelSectionState>(
        builder: (context, state) => _LevelContentScreen(
          onFinishedWithResult: (samples) {
            if (state.level.id == "freeMovement") {
              context.router.maybePop();
            } else {
              context.read<LevelSectionCubit>().addAttemptFromSamples(samples);
              context.router.replace(const LevelResultsRoute());
            }
          },
          level: state.level,
        ),
      );
}

@RoutePage()
class ActivityLevelScreen extends StatelessWidget {
  const ActivityLevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActivitySectionCubit, ActivitySectionState>(
        builder: (context, state) => _LevelContentScreen(
          onFinishedWithResult: (samples) {
            context.read<ActivitySectionCubit>().addAttemptFromSamples(samples);
            context.router.replace(const ActivityResultsRoute());
          },
          level: state.currentLevel!,
        ),
      );
}

@RoutePage()
class SessionActivityLevelScreen extends StatelessWidget {
  const SessionActivityLevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocSelector<GameSessionSectionCubit, GameSessionSectionState, Level?>(
        selector: (state) => state.currentLevel,
        builder: (context, state) => _LevelContentScreen(
          onFinishedWithResult: (samples) {
            context
                .read<GameSessionSectionCubit>()
                .addAttemptFromSamples(samples);
            context.router.replace(const SessionActivityResultsRoute());
          },
          level: state!,
        ),
      );
}

class _LevelContentScreen extends StatelessWidget {
  final void Function(List<Pair<double, double>> samples) onFinishedWithResult;
  final Level level;

  const _LevelContentScreen({
    required this.onFinishedWithResult,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GameWidget(
        game: SimonGame(
          level: level,
          onFinishedWithResult: onFinishedWithResult,
          globalSectionCubit: context.read<GlobalSectionCubit>(),
        ),
        backgroundBuilder: (context) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.images.backgroundWood.path,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
