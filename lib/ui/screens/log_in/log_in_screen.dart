import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';

import 'log_in_cubit.dart';

@RoutePage()
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => LogInCubit(),
        child: _LogInContentScreen(),
      );
}

class _LogInContentScreen extends StatefulWidget {
  @override
  State<_LogInContentScreen> createState() => _LogInContentScreenState();
}

class _LogInContentScreenState extends State<_LogInContentScreen> {
  late final TextEditingController emailController;
  late final TextEditingController codeController;
  late LogInCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<LogInCubit>();
    emailController = TextEditingController();
    codeController = TextEditingController();
  }

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
                      "¡Hola de nuevo!",
                      style: context.theme.textStyles.titleMedium!.copyWith(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 394.w,
                      child: BlocBuilder<LogInCubit, LogInState>(
                        builder: (context, state) {
                          if (state.error != null) {
                            return Text(
                              state.error!,
                              style: TextStyle(color: Colors.red),
                            );
                          }

                          return Column(
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
                                            await _cubit.login();
                                            if (_cubit.state.error == null) {
                                              context.router.replace(
                                                  const WelcomeRoute());
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
                                        : const Text("Ingresar"),
                                  ),
                                ),
                              ] else ...[
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
                                        context.theme.textStyles.bodyLarge,
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
                          );
                        },
                      ),
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
                        const Text("¿Todavía no tenés cuenta?"),
                        ElevatedButton(
                          onPressed: () {
                            context.router.replaceAll([
                              const GlobalSectionRoute(),
                              const SignUpSectionRoute(),
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
