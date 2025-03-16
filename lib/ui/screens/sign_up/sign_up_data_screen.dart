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
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/dividers.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
        builder: (context, state) => MotionScaffold(
          simpleBackground: true,
          action: () {},
          actionIcon: PhosphorIcons.gear(),
          backRoute: const SignUpTypeRoute(),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 90.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "¡Bienvenido, ${state.userType == UserType.student ? "Estudiante" : "Profe"}!",
                    style: context.theme.textStyles.headlineLarge!.copyWith(
                      color: context.theme.colorScheme.onSurface,
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
                                        if (context.mounted) {
                                          Logger.d("Navigating");
                                          context.router.replaceAll(
                                              [const GlobalSectionRoute()]);
                                        }
                                      }
                                    },
                              style: context.theme.buttonsStyle.filledButton
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
                                      color:
                                          context.theme.colorScheme.onPrimary,
                                    )
                                  : const Text("Crear cuenta"),
                            ),
                          ),
                        ] else
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                      await _cubit.requestCode();
                                    },
                              style: context.theme.buttonsStyle.filledButton
                                  .copyWith(
                                fixedSize: WidgetStatePropertyAll(
                                  Size(180.w, 56.h),
                                ),
                                textStyle: WidgetStatePropertyAll(
                                  context.theme.textStyles.bodyLarge,
                                ),
                              ),
                              child: state.isLoading
                                  ? CircularProgressIndicator(
                                      color:
                                          context.theme.colorScheme.onPrimary,
                                    )
                                  : const Text("Enviar código"),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const HorizontalDivider(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 36.h,
                    children: [
                      const Text("¿Ya tenés cuenta?"),
                      SecondaryButton(
                        onPressed: () {
                          context.router.replace(const LogInRoute());
                        },
                        label: "Ingresar",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
