import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/user/user.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/theme/components/cards.dart';
import 'package:imitador/model/activity/activity.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => _WelcomeContentScreen();
}

final freeMovementLevel = Level(
  id: "freeMovement",
  name: "Movimiento Libre (práctica)",
  difficulty: null,
  minPosition: 0,
  maxPosition: 10,
  secondsDuration: 10,
  positionExpressions: [],
);

final easyLevel = Level(
  id: "easy",
  name: "Fácil",
  difficulty: Difficulty.easy,
  minPosition: 0,
  maxPosition: 10,
  secondsDuration: 10,
  positionExpressions: [],
);

final mediumLevel = Level(
  id: "medium",
  name: "Medio",
  difficulty: Difficulty.medium,
  minPosition: 0,
  maxPosition: 10,
  secondsDuration: 10,
  positionExpressions: [],
);

final hardLevel = Level(
  id: "hard",
  name: "Difícil",
  difficulty: Difficulty.hard,
  secondsDuration: 10,
  minPosition: 0,
  maxPosition: 10,
  positionExpressions: [],
);

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GlobalSectionCubit, GlobalSectionState>(
        builder: (context, state) => MotionScaffold(
          actionIcon: PhosphorIcons.gear(),
          showTitle: false,
          simpleBackground: true,
          action: () {
            context.router.push(const SettingsRoute());
          },
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
            child: state.user != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: _AuthenticatedMenu(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const GuestActions(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 36.h,
                        children: [
                          Text(
                            "¿Todavía no tenés cuenta?",
                            style: context.theme.textStyles.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SecondaryButton(
                            onPressed: () {
                              context.router.push(const SignUpSectionRoute());
                            },
                            label: "Registrate",
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      );
}

class _AuthenticatedMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities =
        context.watch<GlobalSectionCubit>().state.activities ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top row: Sesión de juego & Juegos libres
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sesión de juego
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sesión de juego',
                    style: context.theme.textStyles.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      if (context.read<GlobalSectionCubit>().state.user
                          is Teacher) {
                        context.router.push(const CreateSessionRoute());
                      } else {
                        context.router.push(const JoinSessionRoute());
                      }
                    },
                    child: SizedBox(
                      width: 290.w,
                      height: 205.h,
                      child: SheetContainer(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.images.menus.connectedDots.path,
                                width: 118.w,
                                height: 109.h,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                context.read<GlobalSectionCubit>().state.user
                                        is Teacher
                                    ? 'CREAR'
                                    : 'UNIRSE',
                                style: context.theme.textStyles.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 32.w),
            // Juegos libres
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juegos libres',
                    style: context.theme.textStyles.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          context.router.push(
                            LevelSectionRoute(level: freeMovementLevel),
                          );
                        },
                        child: SizedBox(
                          height: 205.h,
                          width: 290.w,
                          child: SheetContainer(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.menus.cube.path,
                                    width: 100.w,
                                  ),
                                  SizedBox(height: 12.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Text(
                                      'Movimiento libre\n(práctica)',
                                      textAlign: TextAlign.center,
                                      style: context
                                          .theme.textStyles.headlineSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(width: 24.w),
                      Expanded(
                        child: SizedBox(
                          height: 205.h,
                          width: 290.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.router.push(
                                      LevelSectionRoute(level: easyLevel),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          'Nivel fácil',
                                          textAlign: TextAlign.center,
                                          style: context
                                              .theme.textStyles.headlineSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.router.push(
                                      LevelSectionRoute(level: mediumLevel),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          'Nivel medio',
                                          textAlign: TextAlign.center,
                                          style: context
                                              .theme.textStyles.headlineSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.router.push(
                                      LevelSectionRoute(level: hardLevel),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          'Nivel difícil',
                                          textAlign: TextAlign.center,
                                          style: context
                                              .theme.textStyles.headlineSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 48.h),
        // Juegos en clase
        Text(
          'Juegos en clase',
          style: context.theme.textStyles.headlineSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...[
                {
                  'title': '¿Qué regularidades hay?',
                  'image': Assets.images.menus.notebook.path
                },
                {
                  'title': 'Se mueve se mueve',
                  'image': Assets.images.menus.lines.path
                },
                {'title': 'El cruce', 'image': Assets.images.menus.lamp.path},
                {
                  'title': 'Análisis de una gráfica de x(t)',
                  'image': Assets.images.menus.paperPlaneWithLine.path
                },
                {
                  'title': 'Análisis de gráficas de x(t) y de v(t)',
                  'image': Assets.images.menus.setSquareWithQuestion.path
                },
              ].map((game) {
                final activity = activities.cast<Activity?>().firstWhere(
                      (a) =>
                          a != null &&
                          a.name.trim().toLowerCase() ==
                              game['title']!.trim().toLowerCase(),
                      orElse: () => null,
                    );
                return _ClassGameCard(
                  title: game['title']!,
                  image: game['image']!,
                  activity: activity,
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ClassGameCard extends StatelessWidget {
  final String title;
  final String image;
  final Activity? activity;
  const _ClassGameCard(
      {required this.title, required this.image, this.activity});

  @override
  Widget build(BuildContext context) {
    final cardContent = SheetContainer(
      child: Center(
        child: Column(
          spacing: 14.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 100.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.theme.textStyles.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
    if (activity != null) {
      return InkWell(
        onTap: () {
          context.router.push(ActivitySectionRoute(activityId: activity!.id));
        },
        child: SizedBox(
          width: 227.w,
          height: 250.h,
          child: cardContent,
        ),
      );
    }
    return SizedBox(
      width: 227.w,
      height: 250.h,
      child: cardContent,
    );
  }
}

class GuestActions extends StatelessWidget {
  const GuestActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 28.w,
      children: [
        PrimaryButton(
          onPressed: () {
            context.router.push(const LogInRoute());
          },
          label: context.localizations.sign_in,
        ),
        PrimaryOutlineButton(
          onPressed: () {
            context.router.push(const LevelSelectorRoute());
          },
          label: context.localizations.play_as_guest,
        ),
      ],
    );
  }
}

class UserActions extends StatelessWidget {
  final User user;

  const UserActions({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 28.w,
            children: [
              PrimaryButton(
                onPressed: () {
                  context.router.push(const LevelSelectorRoute());
                },
                label: "Jugar",
              ),
              PrimaryOutlineButton(
                onPressed: () {
                  context.router.push(const JoinSessionRoute());
                },
                label: "Unirse a una clase",
              ),
            ],
          ),
          if (user is Teacher) ...[
            SizedBox(height: 28.h),
            PrimaryOutlineButton(
              onPressed: () {
                context.router.push(const CreateSessionRoute());
              },
              label: "Crear una sesión de juego",
            ),
          ],
        ],
      );
}
