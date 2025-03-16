// ignore_for_file: overridden_fields
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/ui/theme/app_text_styles.dart';
import 'package:imitador/ui/theme/custom_colors.dart';

const FontWeight _semiboldWeight = FontWeight.w600;

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  const CustomTextStyles({
    required this.bodyTiny,
    required this.overline,
    required this.linkLarge,
    required this.linkMedium,
    required this.linkSmall,
    required this.linkTiny,
    required this.linkOverline,
    required this.customColors,
  }) : super();

  final TextStyle bodyTiny;
  final TextStyle overline;
  final TextStyle linkLarge;
  final TextStyle linkMedium;
  final TextStyle linkSmall;
  final TextStyle linkTiny;
  final TextStyle linkOverline;
  final CustomColors customColors;

  static CustomTextStyles getCustomTextStyles(CustomColors customColors) =>
      CustomTextStyles(
        bodyTiny: spaceGroteskTextStyle(12.sp, FontWeight.normal, 1.4),
        overline: spaceGroteskTextStyle(10.sp, FontWeight.normal, 1.4),
        linkLarge: spaceGroteskTextStyle(24.sp, _semiboldWeight, 1.4).copyWith(
          decoration: TextDecoration.underline,
        ),
        linkMedium: spaceGroteskTextStyle(16.sp, _semiboldWeight, 1.4).copyWith(
          decoration: TextDecoration.underline,
        ),
        linkSmall: spaceGroteskTextStyle(14.sp, _semiboldWeight, 1.4).copyWith(
          decoration: TextDecoration.underline,
        ),
        linkTiny: spaceGroteskTextStyle(12.sp, _semiboldWeight, 1.4).copyWith(
          decoration: TextDecoration.underline,
        ),
        linkOverline:
            spaceGroteskTextStyle(10.sp, _semiboldWeight, 1.4).copyWith(
          decoration: TextDecoration.underline,
        ),
        customColors: customColors,
      );

  @override
  CustomTextStyles copyWith({MaterialColor? primary}) =>
      CustomTextStyles.getCustomTextStyles(customColors);

  @override
  CustomTextStyles lerp(CustomTextStyles? other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }
    return CustomTextStyles(
      bodyTiny: TextStyle.lerp(bodyTiny, other.bodyTiny, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      linkLarge: TextStyle.lerp(linkLarge, other.linkLarge, t)!,
      linkMedium: TextStyle.lerp(linkMedium, other.linkMedium, t)!,
      linkSmall: TextStyle.lerp(linkSmall, other.linkSmall, t)!,
      linkTiny: TextStyle.lerp(linkTiny, other.linkTiny, t)!,
      linkOverline: TextStyle.lerp(linkOverline, other.linkOverline, t)!,
      customColors: customColors,
    );
  }

  @override
  Object get type => CustomTextStyles;
}
