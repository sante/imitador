import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/ui/theme/app_theme.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onPressed;

  const ActivityCard({
    required this.activity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(activity.name),
            Text(
              "${activity.levels.length} niveles",
              style: context.theme.textStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
