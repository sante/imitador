import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/ui/theme/app_theme.dart';

class LevelCard extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LevelCard({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290.w,
      height: 205.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: context.theme.buttonsStyle.outlineButton.copyWith(
          fixedSize: WidgetStatePropertyAll(Size(290.w, 205.h)),
        ),
        child: Text(label),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onPressed;

  const ActivityCard({
    required this.activity,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 290.w,
        height: 205.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: context.theme.buttonsStyle.outlineButton.copyWith(
            fixedSize: WidgetStatePropertyAll(Size(290.w, 205.h)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(activity.name),
              Text(
                "${activity.levels.length} niveles",
                style: context.theme.textStyles.bodySmall?.copyWith(
                  color: context.theme.colorScheme.primary.getShade(400),
                ),
              ),
            ],
          ),
        ),
      );
}

class UserTypeCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const UserTypeCard({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: context.theme.buttonsStyle.outlineButton.copyWith(
          fixedSize: WidgetStatePropertyAll(
            Size(395.w, 279.h),
          ),
        ),
        child: Text(
          label,
          style: context.theme.textStyles.headlineSmall?.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ),
      );
}
