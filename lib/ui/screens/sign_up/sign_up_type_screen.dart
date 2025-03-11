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

@RoutePage()
class SignUpTypeScreen extends StatelessWidget {
  const SignUpTypeScreen({super.key});

  @override
  Widget build(BuildContext context) => _SignUpContentScreen();
}

class _SignUpContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 104.w),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
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
                Text(
                  "Elegí tu tipo de cuenta",
                  style: context.theme.textStyles.titleMedium!.copyWith(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  spacing: 24.w,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<SignUpSectionCubit>().setUserType(UserType.student);
                        context.router.push(const SignUpDataRoute());
                      },
                      style: context.theme.buttonsStyle.secondaryOutlineButton.copyWith(
                        fixedSize: WidgetStatePropertyAll(
                          Size(395.w, 279.h),
                        ),
                      ),
                      child: Text(
                        "Estudiante",
                        style: context.theme.customTextStyles.buttonLarge,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SignUpSectionCubit>().setUserType(UserType.teacher);
                        context.router.push(const SignUpDataRoute());
                      },
                      style: context.theme.buttonsStyle.secondaryOutlineButton.copyWith(
                        fixedSize: WidgetStatePropertyAll(
                          Size(395.w, 279.h),
                        ),
                      ),
                      child: Text(
                        "Profesor",
                        style: context.theme.customTextStyles.buttonLarge,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: context.theme.colorScheme.primary.getShade(300),
                  height: 2.h,
                  width: 432.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 36.h,
                  children: [
                    const Text("¿Ya tenés cuenta?"),
                    ElevatedButton(
                      onPressed: () {
                        context.router.replaceAll([
                          const GlobalSectionRoute(),
                          const LogInRoute(),
                        ]);
                      },
                      style: context
                          .theme.buttonsStyle.secondaryFilledButton
                          .copyWith(
                        fixedSize: WidgetStatePropertyAll(
                          Size(186.w, 56.h),
                        ),
                      ),
                      child: Text(
                        "Ingresar",
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
                onPressed: () {},
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
  );
}
