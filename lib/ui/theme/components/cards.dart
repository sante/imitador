import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LevelCard extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? image;
  final double? customHeight;
  final double? customWidth;

  const LevelCard({
    required this.label,
    required this.onPressed,
    super.key,
    this.image,
    this.customHeight,
    this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: customWidth ?? 290.w,
          height: customHeight ?? 205.h,
          child: SheetContainer(
            child: Center(
              child: Column(
                spacing: 14.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    Image.asset(
                      image!,
                      width: 100.w,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: context.theme.textStyles.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onPressed;
  final bool selected;

  const ActivityCard({
    required this.activity,
    required this.onPressed,
    this.selected = false,
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
              if (selected)
                PhosphorIcon(
                  PhosphorIcons.check(),
                  color: context.theme.colorScheme.primary.getShade(400),
                  size: 24.r,
                ),
            ],
          ),
        ),
      );
}

class UserTypeCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final UserType userType;

  const UserTypeCard({
    super.key,
    required this.onPressed,
    required this.label,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: context.theme.colorScheme.onSurface,
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundSheet.path),
            fit: BoxFit.cover,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: context.theme.buttonsStyle.outlineButton.copyWith(
            side: const WidgetStatePropertyAll(null),
            minimumSize: WidgetStatePropertyAll(
              Size(395.w, 280.h),
            ),
            backgroundColor: const WidgetStatePropertyAll(
              Colors.transparent,
            ),
            elevation: const WidgetStatePropertyAll(0.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                Image(
                  image: AssetImage(userType.iconPath),
                  width: 250.r,
                  height: 250.r,
                ),
                Text(
                  label,
                  style: context.theme.textStyles.headlineSmall?.copyWith(
                    color: context.theme.colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
