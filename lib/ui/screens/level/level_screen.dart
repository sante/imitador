import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';

@RoutePage()
class LevelScreen extends StatelessWidget {
  final PlaySessionType sessionType;

  const LevelScreen({
    this.sessionType = PlaySessionType.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => _LevelContentScreen(
    onFinishedWithResult: (samples) {
      context.read<LevelSectionCubit>().addAttemptFromSamples(samples);
      context.router
          .replace(ResultsRoute(sessionType: sessionType));
    },
  );
}

class _LevelContentScreen extends StatelessWidget {
  final void Function(List<Pair<double, double>> samples) onFinishedWithResult;

  const _LevelContentScreen({
    required this.onFinishedWithResult,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LevelSectionCubit, LevelSectionState>(
        builder: (context, state) => GameWidget(
          game: SimonGame(
            level: state.level,
            onFinishedWithResult: onFinishedWithResult,
          ),
        ),
      );
}
