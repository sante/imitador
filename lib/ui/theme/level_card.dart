import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
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
