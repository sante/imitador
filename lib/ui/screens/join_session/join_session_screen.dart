import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/error_view.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';

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
        extendBodyBehindAppBar: true,
        backRoute: const WelcomeRoute(),
        body: Center(
          child: SheetContainer(
            maxWidth: 604.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 72.w, vertical: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 52.h,
                children: [
                  Text(
                    "Unite a la sesión",
                    style: context.theme.textStyles.titleMedium!.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Ingresá el código de 4 dígitos que te brindó tu profesor para empezar a jugar y competir con tus compañeros.",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  BlocBuilder<JoinSessionCubit, JoinSessionState>(
                    builder: (context, state) {
                      return Column(
                        spacing: 40.h,
                        children: [
                          Column(
                            spacing: 16.h,
                            children: [
                              AppTextField(
                                controller: codeController,
                                label: "Código",
                                onChanged: (code) {
                                  _cubit.setCode(code);
                                },
                              ),
                              if (state.error != null)
                                ErrorView(error: state.error!),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: PrimaryButton(
                              label: "Unirse",
                              onPressed: state.isLoading || state.code.isEmpty
                                  ? null
                                  : () async {
                                      final response =
                                          await _cubit.joinGameSession();
                                      if (response != null && context.mounted) {
                                        context.router.replace(
                                            const GameSessionSectionRoute());
                                      }
                                    },
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
        ),
      );
}
