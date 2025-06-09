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

Level _buildFreeMovementLevel(BuildContext context) => Level(
      id: "freeMovement",
      name: context.localizations.level_free_movement_practice_name,
      difficulty: null,
      minPosition: -10,
      maxPosition: 10,
      secondsDuration: 10,
      positionExpressions: [],
      speedExpressions: [],
    );

Level _buildEasyLevel(BuildContext context) => Level(
      id: "easy",
      name: context.localizations.level_easy_name,
      difficulty: Difficulty.easy,
      minPosition: -10,
      maxPosition: 10,
      secondsDuration: 10,
      positionExpressions: [],
      speedExpressions: [],
    );

Level _buildMediumLevel(BuildContext context) => Level(
      id: "medium",
      name: context.localizations.level_medium_name,
      difficulty: Difficulty.medium,
      minPosition: -10,
      maxPosition: 10,
      secondsDuration: 10,
      positionExpressions: [],
      speedExpressions: [],
    );

Level _buildHardLevel(BuildContext context) => Level(
      id: "hard",
      name: context.localizations.level_hard_name,
      difficulty: Difficulty.hard,
      secondsDuration: 10,
      minPosition: -10,
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
          message: state.user != null
              ? context.localizations
                  .welcome_message_user(state.user?.name ?? '')
              : context.localizations.welcome_message_guest,
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
                                text: context.localizations.mission,
                                style: context.theme.textStyles.titleMedium!
                                    .copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                                children: [
                                  TextSpan(
                                    text: context.localizations.motion,
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
                                    context.localizations.no_account_yet,
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
                                    label: context.localizations.register,
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
                    context.localizations.game_session,
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
                                      ? context.localizations.create
                                      : context.localizations.join,
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
                    context.localizations.free_play,
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
                            LevelSectionRoute(
                                level: _buildFreeMovementLevel(context)),
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
                                      context
                                          .localizations.free_movement_practice,
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
                                      LevelSectionRoute(
                                          level: _buildEasyLevel(context)),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          context.localizations.level_easy,
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
                                      LevelSectionRoute(
                                          level: _buildMediumLevel(context)),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          context.localizations.level_medium,
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
                                      LevelSectionRoute(
                                          level: _buildHardLevel(context)),
                                    );
                                  },
                                  child: SheetContainer(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Text(
                                          context.localizations.level_hard,
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
          context.localizations.in_class_games,
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
                label: context.localizations.play,
              ),
              PrimaryOutlineButton(
                onPressed: () {
                  context.router.push(const JoinSessionRoute());
                },
                label: context.localizations.join,
              ),
            ],
          ),
          if (user is Teacher) ...[
            SizedBox(height: 28.h),
            PrimaryOutlineButton(
              onPressed: () {
                context.router.push(const CreateSessionRoute());
              },
              label: context.localizations.create,
            ),
          ],
        ],
      );
}
