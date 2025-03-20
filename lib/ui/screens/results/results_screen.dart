import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/game/components/graph/graph_component.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class LevelResultsScreen extends StatelessWidget {
  const LevelResultsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LevelSectionCubit, LevelSectionState>(
        builder: (context, state) => _ResultsContentScreen(
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
            state.currentLevel!,
          );
          final isLastLevel = levelIndex == state.activity!.levels.length - 1;
          return _ResultsContentScreen(
            attempt: state.attempts.last,
            canSelectLevel: true,
            sessionType: PlaySessionType.activity,
            onNextLevel: !isLastLevel
                ? () {
                    context.read<ActivitySectionCubit>().setCurrentLevel(
                        state.activity!.levels[levelIndex! + 1]);
                    context.router.replace(const ActivityLevelRoute());
                  }
                : null,
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
  Widget build(BuildContext context) => MotionScaffold(
        showTitle: false,
        actionIcon: PhosphorIcons.gear(),
        action: () {
          context.router.push(const SettingsRoute());
        },
        body: Center(
          child: SizedBox(
            width: 764.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40.h,
              children: [
                SheetContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 80.w,
                      vertical: 48.h,
                    ),
                    child: Column(
                      spacing: 24.h,
                      children: [
                        Text(
                          attempt.level.name,
                          style: context.theme.textStyles.headlineSmall!.copyWith(
                            color: context.theme.colorScheme.surface,
                          ),
                        ),
                        Text(
                          scoreMessage(attempt.score),
                          style: context.theme.textStyles.headlineLarge!.copyWith(
                            color: context.theme.colorScheme.surface,
                          ),
                        ),
                        starsImage(attempt.stars.toDouble()),
                        CustomPaint(
                          size: Size(620.w, 442.h),
                          painter: GraphPainter(attempt: attempt),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryOutlineButton(
                      onPressed: () {
                        context.replaceRoute(switch (sessionType) {
                          PlaySessionType.activity => const ActivityLevelRoute(),
                          PlaySessionType.level => const LevelRoute(),
                          // TODO: Handle this case.
                          _ => throw UnimplementedError(),
                        });
                      },
                      trailingIcon: PhosphorIcons.arrowsClockwise(),
                      label: "Reintentar",
                    ),
                    if (canSelectLevel)
                      SecondaryButton(
                        onPressed: () {
                          context.router.navigate(switch (sessionType) {
                            PlaySessionType.activity =>
                              const ActivityLevelSelectorRoute(),
                            // TODO: Handle this case.
                            _ => throw UnimplementedError(),
                          });
                        },
                        label: "Elegir otro nivel",
                      ),
                    if (onNextLevel != null)
                      PrimaryButton(
                        onPressed: onNextLevel,
                        trailingIcon: PhosphorIcons.arrowRight(),
                        label: "Siguiente nivel",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

String scoreMessage(int score) => "Muy bien"; // TODO add real cases

Image starsImage(double stars) => Image.asset(
    switch (stars) {
      < 1 => Assets.images.rating05,
      < 1.5 => Assets.images.rating1,
      < 2 => Assets.images.rating15,
      < 2.5 => Assets.images.rating2,
      < 3 => Assets.images.rating25,
      < 3.5 => Assets.images.rating3,
      < 4 => Assets.images.rating35,
      < 4.5 => Assets.images.rating4,
      < 5 => Assets.images.rating45,
      _ => Assets.images.rating5,
    }
        .path,
height: 72.h,);

class GraphPainter extends CustomPainter {
  final pointPaint = const PaletteEntry(Color(0xffC7EF00)).paint()
    ..strokeWidth = 3.0;
  final objectivePaint = const PaletteEntry(Color(0xffA882DD)).paint()
    ..strokeWidth = 3.0;
  final Attempt attempt;
  final mathContext = ContextModel();

  GraphPainter({
    required this.attempt,
  });

  @override
  void paint(Canvas canvas, Size size) {
    drawGraph(
      canvas: canvas,
      size: Vector2(size.width, size.height),
      axisLinePaint: Paint()..color = Colors.black,
      pointPaint: pointPaint,
      yAxisXOffset: 0,
      samples: attempt.plotPointsX
          .zip(attempt.plotPointsY, (x, y) => Pair(x, y))
          .toList(),
      secondsDuration: attempt.level.secondsDuration,
      fixedExpressions: attempt.expressions,
      effectiveTimeSize: size.width,
      objectivePaint: objectivePaint,
      range: Pair(attempt.level.minPosition, attempt.level.maxPosition),
      mathContext: mathContext,
      fontColor: Colors.black
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
