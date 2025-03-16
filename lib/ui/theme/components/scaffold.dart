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

  const MotionScaffold({
    this.showTitle = true,
    this.backRoute,
    this.actionIcon,
    this.action,
    super.key,
    required this.body,
    this.simpleBackground = false,
    this.message,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(simpleBackground
                  ? Assets.images.backgroundSimple.path
                  : Assets.images.background.path),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: showTitle
                ? RichText(
                    text: TextSpan(
                      text: "Mission: ",
                      style: context.theme.textStyles.headlineMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      children: [
                        TextSpan(
                          text: "Motion",
                          style:
                              context.theme.textStyles.headlineLarge?.copyWith(
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
                        style: context.theme.textTheme.headlineSmall?.copyWith(
                          color: context.theme.colorScheme.onSurface,
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
      );
}
