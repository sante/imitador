import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:imitador/ui/theme/components/error_view.dart';

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
  Widget build(BuildContext context) => MotionScaffold(
        actionIcon: PhosphorIcons.gear(),
        action: () {
          context.router.push(const SettingsRoute());
        },
        simpleBackground: true,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 104.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  context.localizations.hello_again,
                  style: context.theme.textStyles.titleSmall?.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(
                  width: 394.w,
                  child: BlocBuilder<LogInCubit, LogInState>(
                    builder: (context, state) {
                      return Column(
                        spacing: 52.h,
                        children: [
                          AppTextField(
                            controller: emailController,
                            label: context.localizations.mail,
                            onChanged: (email) {
                              _cubit.setEmail(email);
                            },
                            enabled: !state.codeSent,
                          ),
                          if (state.codeSent) ...[
                            AppTextField(
                              controller: codeController,
                              label: context.localizations.code,
                              onChanged: (code) {
                                _cubit.setCode(code);
                              },
                            ),
                          ],
                          if (state.error != null)
                            ErrorView(error: state.error!),
                          if (state.codeSent)
                            Align(
                              alignment: Alignment.centerRight,
                              child: PrimaryButton(
                                label: context.localizations.log_in_button,
                                onPressed: () async {
                                  await _cubit.login();
                                  if (_cubit.state.error == null) {
                                    context.router
                                        .replace(const WelcomeRoute());
                                  } else {
                                    ErrorView(error: _cubit.state.error!);
                                  }
                                },
                                loading: state.isLoading
                                    ? CircularProgressIndicator(
                                        color:
                                            context.theme.colorScheme.onPrimary,
                                      )
                                    : null,
                              ),
                            )
                          else
                            Align(
                              alignment: Alignment.centerRight,
                              child: PrimaryButton(
                                label: context.localizations.send_code,
                                onPressed: () async {
                                  await _cubit.requestCode();
                                },
                                loading: state.isLoading
                                    ? CircularProgressIndicator(
                                        color:
                                            context.theme.colorScheme.onPrimary,
                                      )
                                    : null,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  color: context.theme.customColors.textColor?.getShade(300),
                  height: 2.h,
                  width: 432.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 36.h,
                  children: [
                    Text(context.localizations.no_account_yet),
                    SecondaryButton(
                      onPressed: () {
                        context.router.replaceAll([
                          const GlobalSectionRoute(),
                          const SignUpSectionRoute(),
                        ]);
                      },
                      label: context.localizations.register,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
