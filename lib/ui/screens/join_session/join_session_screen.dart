import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:imitador/ui/theme/components/buttons.dart';

import 'join_session_cubit.dart';

@RoutePage()
class JoinSessionScreen extends StatelessWidget {
  const JoinSessionScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => JoinSessionCubit(),
        child: _JoinSessionContentScreen(),
      );
}

class _JoinSessionContentScreen extends StatefulWidget {
  @override
  State<_JoinSessionContentScreen> createState() =>
      _JoinSessionContentScreenState();
}

class _JoinSessionContentScreenState extends State<_JoinSessionContentScreen> {
  late final TextEditingController codeController;
  late JoinSessionCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<JoinSessionCubit>();
    codeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => MotionScaffold(
        showTitle: false,
        backRoute: const WelcomeRoute(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 104.w),
            child: SizedBox(
              width: 604.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SheetContainer(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 48.h, horizontal: 60.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 12.h,
                        children: [
                          Text(
                            'Unite a la sesión',
                            style: context.theme.textStyles.titleSmall,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Ingresá el código de 4 dígitos que te brindó tu profesor para empezar a jugar y competir con tus compañeros.',
                            style: context.theme.textStyles.bodyMedium,
                          ),
                          SizedBox(height: 12.h),
                          BlocBuilder<JoinSessionCubit, JoinSessionState>(
                            builder: (context, state) {
                              return Column(
                                spacing: 24.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextField(
                                    controller: codeController,
                                    label: 'Código',
                                    hint: 'ej. 4568',
                                    onChanged: (code) {
                                      _cubit.setCode(code);
                                    },
                                    labelColor: Colors.grey,
                                    backgroundColor: Colors.white,
                                    fullWidth: true,
                                    textColor: Colors.black,
                                  ),
                                  if (state.error != null)
                                    Text(
                                      state.error!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: PrimaryButton(
                                      label: 'Ingresar',
                                      onPressed: state.isLoading
                                          ? null
                                          : () async {
                                              final response = await _cubit
                                                  .joinGameSession();
                                              if (response != null &&
                                                  context.mounted) {
                                                context.router.replace(
                                                    const GameSessionSectionRoute());
                                              }
                                            },
                                      loading: state.isLoading
                                          ? CircularProgressIndicator(
                                              color: context
                                                  .theme.colorScheme.onPrimary,
                                            )
                                          : null,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
