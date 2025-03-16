import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';

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
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 104.w),
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 52.h,
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
                      "Ingresa el código de la sesión",
                      style: context.theme.textStyles.titleMedium!.copyWith(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 394.w,
                      child: BlocBuilder<JoinSessionCubit, JoinSessionState>(
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
                                          final response =
                                              await _cubit.joinGameSession();
                                          if (response != null &&
                                              context.mounted) {
                                            final gameSessionCubit =
                                                context.read<
                                                    GameSessionSectionCubit>();
                                            gameSessionCubit.setGameId(
                                              gameId: response.id,
                                            );
                                            context.router.replace(
                                                const GameSessionSectionRoute());
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
                                          color: context
                                              .theme.colorScheme.onPrimary,
                                        )
                                      : const Text("Unirse"),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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
