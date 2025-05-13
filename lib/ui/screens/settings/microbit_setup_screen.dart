import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';

@RoutePage()
class MicrobitSetupScreen extends StatefulWidget {
  const MicrobitSetupScreen({super.key});

  @override
  State<MicrobitSetupScreen> createState() => _MicrobitSetupScreenState();
}

class _MicrobitSetupScreenState extends State<MicrobitSetupScreen> {
  int step = 0;

  void nextStep() {
    setState(() {
      step++;
    });
  }

  void prevStep() {
    setState(() {
      step--;
    });
  }

  @override
  Widget build(BuildContext context) => MotionScaffold(
        backRoute: const SettingsRoute(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: SizedBox(
              width: 604.w,
              child: SheetContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.h,
                    horizontal: 72.w,
                  ),
                  child: _buildStepContent(context),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildStepContent(BuildContext context) {
    switch (step) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.connect_sensor_title,
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              context.localizations.microbit_connect_step_1_description,
              style: context.theme.textStyles.bodyLarge,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Image.asset(
                Assets.images.microbit.connectMicrobit.path,
                gaplessPlayback: true,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryButton(
                label: context.localizations.next_button,
                onPressed: nextStep,
              ),
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.connect_sensor_title,
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              context.localizations.microbit_connect_step_2_description,
              style: context.theme.textStyles.bodyLarge,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Image.asset(Assets.images.microbit.selectMicrobit.path),
            ),
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryButton(
                label: context.localizations.pair_button,
                onPressed: () async {
                  final connected = await context
                      .read<GlobalSectionCubit>()
                      .connectMicrobit();
                  if (connected) {
                    nextStep();
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              context.localizations.microbit_connection_error),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.microbit_connection_success,
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryButton(
                label: context.localizations.go_play_button,
                onPressed: () {
                  context.router.maybePop();
                },
              ),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
