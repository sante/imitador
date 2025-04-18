import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/user/user.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => _WelcomeContentScreen();
}

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
                  SizedBox(
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
                              'UNIRSE',
                              style: context.theme.textStyles.headlineSmall,
                            ),
                          ],
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
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        child: SizedBox(
                          height: 205.h,
                          width: 290.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
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
                              SizedBox(height: 8.h),
                              Expanded(
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
                              SizedBox(height: 8.h),
                              Expanded(
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
              _ClassGameCard(
                  title: '¿Qué regularidades hay?',
                  image: Assets.images.menus.notebook.path),
              _ClassGameCard(
                  title: 'Se mueve se mueve',
                  image: Assets.images.menus.lines.path),
              _ClassGameCard(
                  title: 'El cruce', image: Assets.images.menus.lamp.path),
              _ClassGameCard(
                  title: 'Análisis de gráfica x(t)',
                  image: Assets.images.menus.paperPlaneWithLine.path),
              _ClassGameCard(
                  title: 'Análisis de gráficas x(t) y v(t)',
                  image: Assets.images.menus.setSquareWithQuestion.path),
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
  const _ClassGameCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 227.w,
      height: 250.h,
      child: SheetContainer(
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
      ),
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
