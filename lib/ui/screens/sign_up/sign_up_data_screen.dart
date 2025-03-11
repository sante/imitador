import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/sign_up/sign_up_section_cubit.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';

@RoutePage()
class SignUpDataScreen extends StatelessWidget {
  const SignUpDataScreen({super.key});

  @override
  Widget build(BuildContext context) => _SignUpContentScreen();
}

class _SignUpContentScreen extends StatefulWidget {
  const _SignUpContentScreen({super.key});

  @override
  State<_SignUpContentScreen> createState() => _SignUpContentScreenState();
}

class _SignUpContentScreenState extends State<_SignUpContentScreen> {
  late final emailController = TextEditingController();
  late final codeController = TextEditingController();
  late final nameController = TextEditingController();
  late SignUpSectionCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignUpSectionCubit>();
    emailController.text = _cubit.state.email;
    codeController.text = _cubit.state.code;
    nameController.text = _cubit.state.name;
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignUpSectionCubit, SignUpSectionState>(
        builder: (context, state) =>
            Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 67.h, horizontal: 104.w),
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
                            style: context.theme.textStyles.titleLarge!
                                .copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "¡Bienvenido, ${state.userType == UserType.student ? "Estudiante" : "Profe"}!",
                            style: context.theme.textStyles.titleMedium!
                                .copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              width: 394.w,
                              child: Column(
                                spacing: 52.h,
                                children: [
                                  AppTextField(
                                    controller: emailController,
                                    label: "Email",
                                    onChanged: (email) {
                                      _cubit.setEmail(email);
                                    },
                                    enabled: !state.codeSent,
                                  ),
                                  AppTextField(
                                    controller: nameController,
                                    label: "Nombre completo",
                                    onChanged: (email) {
                                      _cubit.setName(email);
                                    },
                                    enabled: !state.codeSent,
                                  ),
                                  if (state.codeSent) ...[
                                    AppTextField(
                                      controller: codeController,
                                      label: "Código",
                                      onChanged: (code) {
                                        _cubit.setCode(code);
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: state.isLoading
                                            ? null
                                            : () async {
                                          Logger.d("Sign up");
                                          await _cubit.signUp();
                                          Logger.d(_cubit.state);
                                          if (_cubit.state.error == null) {
                                            if(context.mounted) {
                                              Logger.d("Navigating");
                                              context.router.replaceAll(
                                                  [const GlobalSectionRoute()]);
                                            }
                                          }
                                        },
                                        style: context
                                            .theme.buttonsStyle.filledButton
                                            .copyWith(
                                          fixedSize: WidgetStatePropertyAll(
                                            Size(120.w, 56.h),
                                          ),
                                          textStyle: WidgetStatePropertyAll(
                                            context.theme.textStyles.bodyLarge,
                                          ),
                                        ),
                                        child: state.isLoading
                                            ? CircularProgressIndicator(
                                          color: context
                                              .theme.colorScheme.onPrimary,
                                        )
                                            : const Text("Crear cuenta"),
                                      ),
                                    ),
                                  ] else
                                    ...[
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          onPressed: state.isLoading
                                              ? null
                                              : () async {
                                            await _cubit.requestCode();
                                          },
                                          style: context
                                              .theme.buttonsStyle.filledButton
                                              .copyWith(
                                            fixedSize: WidgetStatePropertyAll(
                                              Size(180.w, 56.h),
                                            ),
                                            textStyle: WidgetStatePropertyAll(
                                              context.theme.textStyles
                                                  .bodyLarge,
                                            ),
                                          ),
                                          child: state.isLoading
                                              ? CircularProgressIndicator(
                                            color: context
                                                .theme.colorScheme.onPrimary,
                                          )
                                              : const Text("Enviar código"),
                                        ),
                                      ),
                                    ],
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Olvidé mi contraseña"),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            color: context.theme.colorScheme.primary.getShade(
                                300),
                            height: 2.h,
                            width: 432.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 36.h,
                            children: [
                              const Text("¿Ya tenés cuenta?"),
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
                                  "Ingresar",
                                  style: context.theme.customTextStyles
                                      .buttonLarge,
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
                          style: context.theme.buttonsStyle.filledButton
                              .copyWith(
                              fixedSize: WidgetStatePropertyAll(
                                  Size(56.r, 56.r))),
                          child: Icon(
                            Icons.settings,
                            color: context.theme.colorScheme.onPrimary,
                            size: 16.r,
                          ),
                        ),
                      )
                    ],
                  )

                  ,

                )

                ,

              )

              ,

            )

        ,

      );
}
