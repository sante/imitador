import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/user/user.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';

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
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 200.h, horizontal: 104.w),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        context.localizations.game_title.toUpperCase(),
                        style: context.theme.textStyles.titleLarge!.copyWith(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (state.user == null) const GuestActions(),
                      if (state.user != null) UserActions(user: state.user!),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 36.h,
                        children: [
                          Text("¿Todavía no tenés cuenta?"),
                          ElevatedButton(
                            onPressed: () {},
                            style: context
                                .theme.buttonsStyle.secondaryFilledButton
                                .copyWith(
                              fixedSize: WidgetStatePropertyAll(
                                Size(186.w, 56.h),
                              ),
                            ),
                            child: Text(
                              "Registrate",
                              style: context.theme.customTextStyles.buttonLarge,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(const SettingsRoute());
                      },
                      style: context.theme.buttonsStyle.filledButton.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(56.r, 56.r))),
                      child: Icon(
                        Icons.settings,
                        color: context.theme.colorScheme.onPrimary,
                        size: 16.r,
                      ),
                    ),
                  )
                ],
              ),
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
        ElevatedButton(
          onPressed: () {
            context.router.push(const LevelSelectorRoute());
          },
          style: context.theme.buttonsStyle.filledButton.copyWith(
            fixedSize: WidgetStatePropertyAll(Size(268.w, 68.h)),
          ),
          child: Text(
            context.localizations.play_as_guest,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.router.push(const LogInRoute());
          },
          style: context.theme.buttonsStyle.outlineButton.copyWith(
            fixedSize: WidgetStatePropertyAll(Size(268.w, 68.h)),
          ),
          child: Text(
            context.localizations.sign_in,
          ),
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
        ElevatedButton(
          onPressed: () {
            context.router.push(const LevelSelectorRoute());
          },
          style: context.theme.buttonsStyle.filledButton.copyWith(
            fixedSize: WidgetStatePropertyAll(Size(268.w, 68.h)),
          ),
          child: const Text(
            "Jugar",
          ),
        ),
        ElevatedButton(
          onPressed: context.read<GlobalSectionCubit>().logOut,
          style: context.theme.buttonsStyle.outlineButton.copyWith(
            fixedSize: WidgetStatePropertyAll(Size(268.w, 68.h)),
          ),
          child: const Text(
            "Cerrar Sesión",
          ),
        ),
      ],
    );
  }
}
