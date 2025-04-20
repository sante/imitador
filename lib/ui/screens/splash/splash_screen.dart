import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => MotionScaffold(
        showTitle: false,
        simpleBackground: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 141.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Mission:",
                        style: context.theme.textStyles.titleLarge?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 96.sp,
                        ),
                      ),
                      Text(
                        "MOTION",
                        style: context.theme.textStyles.titleLarge?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 128.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                customSize: Size(144.w, 48.h),
                label: "Ingresar",
                trailingIcon: PhosphorIcons.arrowRight(PhosphorIconsStyle.bold),
                onPressed: () {
                  context.router.replace(const WelcomeRoute());
                },
              ),
            ],
          ),
        ),
      );
}
