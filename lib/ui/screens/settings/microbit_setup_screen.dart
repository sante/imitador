import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/app_theme.dart';

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
              'Conectar sensor',
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              'Conectá tu micro:bit a la computadora como muestra el gif',
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
                label: 'Siguiente',
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
              'Conectar sensor',
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              'Emparejá el micro:bit con tu navegador pulsando el botón.\n\nLuego te aparecerá una ventana en la parte superior de tu navegador.\nSeleccioná el dispositivo micro:bit y hacé clic en "Conectar".',
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
                label: 'Emparejar',
                onPressed: nextStep,
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
              '¡micro:bit conectado con éxito!',
              style: context.theme.textStyles.headlineLarge,
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryButton(
                label: 'Ir a jugar!',
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
