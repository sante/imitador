// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.textColor,
    required this.info,
    required this.success,
    required this.warning,
    required this.danger,
  }) : super();

  final Color? textColor;
  final Color? info;
  final Color? success;
  final Color? warning;
  final Color? danger;

  static CustomColors getCustomColors() => const CustomColors(
        textColor: MaterialColor(
          0xffFFFFFF,
          <int, Color>{
            100: Color(0xffFFFFFF),
            200: Color(0xffC1C1C1),
            300: Color(0xff9E9E9E),
            400: Color(0xff6F6F6F),
            500: Color(0xff202020),
          },
        ),
        info: MaterialColor(
          0xff69B3CC,
          <int, Color>{
            100: Color(0xffE3FCFB),
            200: Color(0xffA9E7EF),
            300: Color(0xff69B3CC),
            400: Color(0xff346D92),
            500: Color(0xff143861),
          },
        ),
        success: MaterialColor(
          0xff8CBA80,
          <int, Color>{
            100: Color(0xffF3FBEB),
            200: Color(0xffCEEABE),
            300: Color(0xff8CBA80),
            400: Color(0xff448540),
            500: Color(0xff18591E),
          },
        ),
        warning: MaterialColor(
          0xffF4BB11,
          <int, Color>{
            100: Color(0xffFEF7CF),
            200: Color(0xffFBDF6F),
            300: Color(0xffF4BB11),
            400: Color(0xffAF7D08),
            500: Color(0xff754C03),
          },
        ),
        danger: MaterialColor(
          0xffFC623C,
          <int, Color>{
            100: Color(0xffFEEBD8),
            200: Color(0xffFEB289),
            300: Color(0xffFC623C),
            400: Color(0xffB5251E),
            500: Color(0xff780B16),
          },
        ),
      );

  @override
  CustomColors copyWith({MaterialColor? primary}) =>
      CustomColors.getCustomColors();

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      textColor: Color.lerp(textColor, other.textColor, t),
      info: Color.lerp(info, other.info, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  @override
  Object get type => CustomColors;
}
