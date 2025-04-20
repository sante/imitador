import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/game/screens/level/game_level_screen.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';

class SimonGame extends FlameGame with HasKeyboardHandlerComponents {
  Level level;
  void Function(List<Pair<double, double>> samples) onFinishedWithResult;
  final spriteOutOfBoundsSize = Constants.trackingSpriteSize / 2;
  final GlobalSectionCubit globalSectionCubit;
  final RouterComponent _router;

  SimonGame({
    required this.level,
    required this.onFinishedWithResult,
    required this.globalSectionCubit,
  }) : _router = RouterComponent(
    initialRoute: 'level',
    routes: {
      'level': Route(() =>
          FlameBlocProvider<GlobalSectionCubit, GlobalSectionState>(
            create: () => globalSectionCubit,
            children: [
              GameLevelPage(
                onFinishedWithResult: (samples) {
                  onFinishedWithResult(samples);
                },
              ),
            ],
          )), // OverlayRoute
      'confirm-dialog': OverlayRoute.existing(),
    },
  );

  @override
  Future<void> onLoad() async {
    add(_router);
  }
}
