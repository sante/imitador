import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/user/user.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
          action: () {
            context.router.push(const SettingsRoute());
          },
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 90.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Mission: ",
                    style: context.theme.textStyles.titleMedium!.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                    children: [
                      TextSpan(
                        text: "Motion",
                        style: context.theme.textStyles.titleLarge!.copyWith(
                          color: context.theme.colorScheme.onSurface,
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
                  const GuestActions(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 36.h,
                    children: [
                      Text(
                        "¿Todavía no tenés cuenta?",
                        style: context.theme.textTheme.bodyLarge?.copyWith(
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
                ]
              ],
            ),
          ),
        ),
      );
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
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: context.read<GlobalSectionCubit>().logOut,
          label: "Cerrar Sesión",
        ),
      ],
    );
  }
}
