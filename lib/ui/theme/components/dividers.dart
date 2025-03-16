import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.onSurface,
      height: 2.h,
      width: 432.w,
    );
  }
}

class DarkHorizontalDivider extends StatelessWidget {
  const DarkHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.surface.getShade(100),
      height: 2.h,
      width: 432.w,
    );
  }
}
