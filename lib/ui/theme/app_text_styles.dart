//ignore_for_file: unused-files, unused-code

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const FontWeight _semiboldWeight = FontWeight.w600;

TextStyle russoOneTextStyle(
  double fontSize,
  FontWeight fontWeight,
  double? height,
) =>
    GoogleFonts.russoOne(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    );

TextStyle spaceGroteskTextStyle(
  double fontSize,
  FontWeight fontWeight,
  double? height,
) =>
    GoogleFonts.spaceGrotesk(
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
    );

class AppTextStyles extends TextTheme {
  const AppTextStyles({
    super.headlineLarge,
    super.headlineMedium,
    super.headlineSmall,
    super.bodyLarge,
    super.bodyMedium,
    super.bodySmall,
    super.titleLarge,
    super.titleMedium,
    super.titleSmall,
    super.labelLarge,
    super.labelMedium,
    super.labelSmall,
  });

  factory AppTextStyles.fromTextTheme({
    required TextTheme textTheme,
  }) =>
      AppTextStyles(
        headlineSmall: textTheme.headlineSmall,
        headlineMedium: textTheme.headlineMedium,
        headlineLarge: textTheme.headlineLarge,
        bodyLarge: textTheme.bodyLarge,
        bodyMedium: textTheme.bodyMedium,
        bodySmall: textTheme.bodySmall,
        titleLarge: textTheme.titleLarge,
        titleMedium: textTheme.titleMedium,
        titleSmall: textTheme.titleSmall,
        labelLarge: textTheme.labelLarge,
        labelMedium: textTheme.labelMedium,
        labelSmall: textTheme.labelSmall,
      );

  static TextStyle _robotoTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static AppTextStyles getDefaultAppStyles() => AppTextStyles.fromTextTheme(
        textTheme: GoogleFonts.russoOneTextTheme().copyWith(
          titleLarge: russoOneTextStyle(68.sp, FontWeight.normal, 1.2), //H1
          titleMedium: russoOneTextStyle(56.sp, FontWeight.normal, 1.2), //H2
          titleSmall: russoOneTextStyle(48.sp, FontWeight.normal, 1.2), //H3
          headlineLarge: russoOneTextStyle(40.sp, FontWeight.normal, 1.2), //H4
          headlineMedium: russoOneTextStyle(32.sp, FontWeight.normal, 1.2), //H5
          headlineSmall: russoOneTextStyle(24.sp, FontWeight.normal, 1.2), //H6
          bodyLarge: spaceGroteskTextStyle(20.sp, FontWeight.normal, 1.4),
          bodyMedium: spaceGroteskTextStyle(16.sp, FontWeight.normal, 1.4),
          bodySmall: spaceGroteskTextStyle(14.sp, FontWeight.normal, 1.4),
        ),
      );

  TextTheme getThemeData() => getDefaultAppStyles();
}

extension TextStyleExtensions on TextStyle {
  TextStyle links() => copyWith(
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: color,
      );

  TextStyle semibold() => copyWith(fontWeight: _semiboldWeight);

  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);

  TextStyle regular() => copyWith(fontWeight: FontWeight.normal);
}
