import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/game/simon_game.dart';
import 'package:imitador/model/level/level.dart';

import 'level_cubit.dart';

@RoutePage()
class LevelScreen extends StatelessWidget {
  final Level level;
  final void Function(Pair<double, double>) onFinishedWithResult;

  const LevelScreen({
    required this.level,
    required this.onFinishedWithResult,
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

  const _LevelContentScreen({required this.level});

  @override
  Widget build(BuildContext context) => GameWidget(
      game: SimonGame(
          level:
              level)); // TODO add callbacks to navigate with results
}
