import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/level_card.dart';

import 'level_selector_cubit.dart';

final dummyLevels = [
  Level.random(
    name: 'Fácil',
    difficulty: Difficulty.easy,
  ),
  Level.random(
    name: 'Medio',
    difficulty: Difficulty.medium,
  ),
  Level.random(
    name: 'Difícil',
    difficulty: Difficulty.hard,
  ),
  Level.activity(
    name: "Se mueve se mueve",
    expressions: [],
  ),
];

@RoutePage()
class LevelSelectorScreen extends StatelessWidget {
  const LevelSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => LevelSelectorCubit(),
        child: _LevelSelectorContentScreen(),
      );
}

class _LevelSelectorContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 104.w),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 60.h,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      Text(
                        'Juegos libres',
                        style: context.theme.textStyles.titleLarge!.copyWith(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _LevelsRow(
                          levels: dummyLevels
                              .filter((it) => it is RandomLevel)
                              .toList()),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      Text(
                        'Actividades',
                        style: context.theme.textStyles.titleLarge!.copyWith(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _LevelsRow(
                          levels: dummyLevels
                              .filter((it) => it is Activity)
                              .toList()),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    spacing: 24.w,
                    children: [
                      Text(
                        "¡Hola, invitado!",
                        style: context.theme.textStyles.titleLarge!.copyWith(),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: context.theme.buttonsStyle.filledButton.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(56.r, 56.r)),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: context.theme.buttonsStyle.outlineButton.copyWith(
                      fixedSize: WidgetStatePropertyAll(Size(56.r, 56.r)),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color: context.theme.colorScheme.primary,
                      size: 16.r,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _LevelsRow extends StatelessWidget {
  final List<Level> levels;

  const _LevelsRow({required this.levels, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 205.h,
        child: ListView.separated(
          itemCount: levels.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: context.theme.dimensions.spacing24.w,
          ),
          itemBuilder: (context, index) => LevelCard(
            label: levels[index].name,
            onPressed: () {
              context.router.push(
                LevelRoute(
                  level: levels[index],
                  onFinishedWithResult: (_) {},
                ),
              );
            },
          ),
        ),
      );
}
