import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/router/app_router.dart';

import 'level_cubit.dart';

@RoutePage()
class LevelScreen extends StatelessWidget {
  final Level level;

  const LevelScreen({
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => LevelCubit(),
        child: _LevelContentScreen(
          level: level,
        ),
      );
}

class _LevelContentScreen extends StatelessWidget {
  final Level level;

  const _LevelContentScreen({
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GameWidget(
        game: SimonGame(
          level: level,
          onFinishedWithResult: (samples, level) {
            context.router.replace(ResultsRoute(samples: samples, level: level));
          },
        ),
      );
}
