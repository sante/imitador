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
  final double? customHeight;
  final double? customWidth;
  final bool showLevels;

  const ActivityCard({
    required this.activity,
    required this.onPressed,
    this.selected = false,
    this.customHeight,
    this.customWidth,
    this.showLevels = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? imagePath;
    switch (activity.id) {
      case '6e348198-9aa3-4086-8c7d-e5f47837450a':
        imagePath = Assets.images.menus.notebook.path;
        break;
      case '977547be-4c31-4d14-b029-3d9c0a10340d':
        imagePath = Assets.images.menus.lines.path;
        break;
      case '0ea07475-c400-4cb4-af1b-5f5bb53fa08d':
        imagePath = Assets.images.menus.lamp.path;
        break;
      case 'dd98eafe-e8ad-4064-92cb-0b76434b5c4f':
        imagePath = Assets.images.menus.paperPlaneWithLine.path;
        break;
      case 'f4bda7ea-d725-4a0f-96b5-755c71338bda':
        imagePath = Assets.images.menus.setSquareWithQuestion.path;
        break;
      default:
        imagePath = null;
    }
    final cardContent = SheetContainer(
      border: selected
          ? Border.all(color: context.theme.colorScheme.primary, width: 10)
          : null,
      child: Center(
        child: Column(
          spacing: 14.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Flexible(
                flex: 1,
                child: Image.asset(
                  imagePath,
                  width: 90.w,
                ),
              ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  activity.name,
                  textAlign: TextAlign.center,
                  style: context.theme.textStyles.headlineSmall?.copyWith(
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
            if (showLevels)
              Text(
                "${activity.levels.length} niveles",
                style: context.theme.textStyles.bodySmall,
              ),
          ],
        ),
      ),
    );
    return SizedBox(
      width: customWidth ?? 290.w,
      height: customHeight ?? 215.h,
      child: InkWell(
        onTap: onPressed,
        child: cardContent,
      ),
    );
  }
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
