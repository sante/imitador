import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MotionScaffold extends StatelessWidget {
  final bool showTitle;
  final VoidCallback? action;
  final PhosphorIconData? actionIcon;
  final Widget body;
  final bool simpleBackground;
  final String? message;
  final PageRouteInfo? backRoute;
  final bool extendBodyBehindAppBar;

  const MotionScaffold({
    this.showTitle = true,
    this.backRoute,
    this.actionIcon,
    this.action,
    super.key,
    required this.body,
    this.simpleBackground = false,
    this.message,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF343434),
                  Color(0xFF333333),
                  Color(0xFF202020),
                ],
                radius: 0.6,
                center: Alignment.center,
              ),
            ),
          ),
          if (simpleBackground)
            Positioned(
              top: 20.h,
              right: 20.w,
              width: 1200.w,
              height: 800.w,
              child: Image.asset(
                Assets.images.backgroundIconsSimple.path,
                fit: BoxFit.contain,
              ),
            )
          else
            Image.asset(
              Assets.images.backgroundIcons.path,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          Scaffold(
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: showTitle
                  ? RichText(
                      text: TextSpan(
                        text: "Mission: ",
                        style:
                            context.theme.textStyles.headlineMedium?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                        children: [
                          TextSpan(
                            text: "MOTION",
                            style: context.theme.textStyles.headlineLarge
                                ?.copyWith(
                              color: context.theme.colorScheme.onSurface,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 48.w),
                  child: Row(
                    spacing: 24.w,
                    children: [
                      if (message != null)
                        Text(
                          message!,
                          style:
                              context.theme.textStyles.headlineSmall?.copyWith(
                            color: context.theme.colorScheme.onSurface,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      if (action != null)
                        SecondaryIconButton(
                          icon: actionIcon!,
                          onPressed: action,
                        ),
                    ],
                  ),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leadingWidth: 100.w,
              leading: backRoute != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Center(
                        child: SecondaryIconButton(
                          icon: PhosphorIcons.arrowLeft(),
                          onPressed: () {
                            context.router.replace(backRoute!);
                          },
                        ),
                      ),
                    )
                  : null,
            ),
            body: body,
            backgroundColor: Colors.transparent,
          ),
        ],
      );
}
