import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/sign_up/sign_up_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/cards.dart';
import 'package:imitador/ui/theme/components/dividers.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class SignUpTypeScreen extends StatelessWidget {
  const SignUpTypeScreen({super.key});

  @override
  Widget build(BuildContext context) => _SignUpContentScreen();
}

class _SignUpContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MotionScaffold(
        action: () {},
        actionIcon: PhosphorIcons.gear(),
        showTitle: true,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 104.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Elegí tu tipo de cuenta",
                style: context.theme.textStyles.headlineLarge!.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                spacing: 24.w,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserTypeCard(
                    onPressed: () {
                      context
                          .read<SignUpSectionCubit>()
                          .setUserType(UserType.student);
                      context.router.push(const SignUpDataRoute());
                    },
                    label: "Estudiante",
                  ),
                  UserTypeCard(
                    onPressed: () {
                      context
                          .read<SignUpSectionCubit>()
                          .setUserType(UserType.teacher);
                      context.router.push(const SignUpDataRoute());
                    },
                    label: "Profesor",
                  ),
                ],
              ),
              const HorizontalDivider(),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 36.h,
                children: [
                  const Text("¿Ya tenés cuenta?"),
                  SecondaryButton(
                    onPressed: () {
                      context.router.replaceAll([
                        const GlobalSectionRoute(),
                        const LogInRoute(),
                      ]);
                    },
                    label: "Ingresar",
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
