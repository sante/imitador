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
  speedExpressions: [],
);

final easyLevel = Level(
  id: "easy",
  name: "Fácil",
  difficulty: Difficulty.easy,
  minPosition: 0,
  maxPosition: 10,
  secondsDuration: 10,
  positionExpressions: [],
  speedExpressions: [],
);

final mediumLevel = Level(
  id: "medium",
  name: "Medio",
  difficulty: Difficulty.medium,
  minPosition: 0,
  maxPosition: 10,
  secondsDuration: 10,
  positionExpressions: [],
  speedExpressions: [],
);

final hardLevel = Level(
  id: "hard",
  name: "Difícil",
  difficulty: Difficulty.hard,
  secondsDuration: 10,
  minPosition: 0,
  maxPosition: 10,
  positionExpressions: [],
  speedExpressions: [],
);

class _WelcomeContentScreen extends StatefulWidget {
  @override
  State<_WelcomeContentScreen> createState() => _WelcomeContentScreenState();
}

class _WelcomeContentScreenState extends State<_WelcomeContentScreen> {
  bool guestMode = false;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GlobalSectionCubit, GlobalSectionState>(
        builder: (context, state) => MotionScaffold(
          actionIcon:
              state.user != null ? PhosphorIcons.user() : PhosphorIcons.gear(),
          message: "¡Hola, ${state.user?.name ?? "invitado"}!",
          showTitle: false,
          simpleBackground: state.user != null || guestMode,
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
                : guestMode
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 48.w),
                        child: _AuthenticatedMenu(guestMode: true),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 90.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Mission: ",
                                style: context.theme.textStyles.titleMedium!
                                    .copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                                children: [
                                  TextSpan(
                                    text: "MOTION",
                                    style: context.theme.textStyles.titleLarge!
                                        .copyWith(
                                      color:
                                          context.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (state.user != null) ...[
                              UserActions(user: state.user!),
                              Container()
                            ],
                            if (state.user == null) ...[
                              GuestActions(
                                onPlayAsGuest: () {
                                  setState(() {
                                    guestMode = true;
                                  });
                                },
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 36.h,
                                children: [
                                  Text(
                                    "¿Todavía no tenés cuenta?",
                                    style: context.theme.textTheme.bodyLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SecondaryButton(
                                    onPressed: () {
                                      context.router
                                          .push(const SignUpSectionRoute());
                                    },
                                    label: "Registrate",
                                  ),
                                ],
                              )
                            ]
                          ],
                        ),
                      ),
          ),
        ),
      );
}

class _AuthenticatedMenu extends StatelessWidget {
  final bool guestMode;
  const _AuthenticatedMenu({this.guestMode = false, super.key});

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
                    onTap: guestMode
                        ? null
                        : () {
                            if (context.read<GlobalSectionCubit>().state.user
                                is Teacher) {
                              context.router.push(const CreateSessionRoute());
                            } else {
                              context.router.push(const JoinSessionRoute());
                            }
                          },
                    child: Opacity(
                      opacity: guestMode ? 0.5 : 1.0,
                      child: SizedBox(
                        width: 290.w,
                        height: 225.h,
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
                  ),
                ],
              ),
            ),
            SizedBox(width: 32.w),
            // Juegos libres
            Expanded(
              flex: 3,
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
                          height: 225.h,
                          width: 290.w,
                          child: SheetContainer(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.menus.cube.path,
                                    width: 70.w,
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
                          height: 225.h,
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
        _ActivityCards(activities: activities),
      ],
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
              customHeight: 250.h,
              customWidth: 236.w,
              showLevels: false,
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

class GuestActions extends StatelessWidget {
  final VoidCallback? onPlayAsGuest;
  const GuestActions({this.onPlayAsGuest, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 28.w,
      children: [
        PrimaryButton(
          customSize: Size(240.w, 38.h),
          onPressed: () {
            context.router.push(const LogInRoute());
          },
          label: context.localizations.sign_in,
        ),
        PrimaryOutlineButton(
          onPressed: onPlayAsGuest ??
              () {
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
