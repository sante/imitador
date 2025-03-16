// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

// Colors name extracted from https://www.color-name.com
@immutable
class AppColorScheme extends ColorScheme {
  AppColorScheme({
    required ColorScheme colorScheme,
  }) : super(
    brightness: colorScheme.brightness,
    primary: colorScheme.primary,
    onPrimary: colorScheme.onPrimary,
    primaryContainer: colorScheme.primaryContainer,
    onPrimaryContainer: colorScheme.onPrimaryContainer,
    secondary: colorScheme.secondary,
    onSecondary: colorScheme.onSecondary,
    secondaryContainer: colorScheme.secondaryContainer,
    onSecondaryContainer: colorScheme.onSecondaryContainer,
    tertiary: colorScheme.tertiary,
    onTertiary: colorScheme.onTertiary,
    tertiaryContainer: colorScheme.tertiaryContainer,
    onTertiaryContainer: colorScheme.onTertiaryContainer,
    error: colorScheme.error,
    onError: colorScheme.onError,
    errorContainer: colorScheme.errorContainer,
    onErrorContainer: colorScheme.onErrorContainer,
    surface: colorScheme.surface,
    onSurface: colorScheme.onSurface,
    surfaceContainerHighest: colorScheme.surfaceContainerHighest,
    onSurfaceVariant: colorScheme.onSurfaceVariant,
    outline: colorScheme.outline,
    outlineVariant: colorScheme.outlineVariant,
    shadow: colorScheme.shadow,
    scrim: colorScheme.scrim,
    inverseSurface: colorScheme.inverseSurface,
    onInverseSurface: colorScheme.onInverseSurface,
    inversePrimary: colorScheme.inversePrimary,
    surfaceTint: colorScheme.surfaceTint,
  );

  static AppColorScheme getDefaultColorScheme() =>
      AppColorScheme(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const MaterialColor(
            0xffc7ef00,
            <int, Color>{
              100: Color(0xffF9FDE6),
              200: Color(0xffEEFAB3),
              300: Color(0xffE9F999),
              400: Color(0xffDDF566),
              500: Color(0xffC7EF00),
              600: Color(0xff9FBF00),
              700: Color(0xff778F00),
              800: Color(0xff506000),
              900: Color(0xff3C4800),
              1000: Color(0xff283000),
            },
          ),
          primary: const MaterialColor(
            0xffc7ef00,
            <int, Color>{
              100: Color(0xffF9FDE6),
              200: Color(0xffEEFAB3),
              300: Color(0xffE9F999),
              400: Color(0xffDDF566),
              500: Color(0xffC7EF00),
              600: Color(0xff9FBF00),
              700: Color(0xff778F00),
              800: Color(0xff506000),
              900: Color(0xff3C4800),
              1000: Color(0xff283000),
            },
          ),
          onPrimary: const MaterialColor(
            0xff202020,
            <int, Color>{
              100: Color(0xff202020),
              200: Color(0xff202020),
              300: Color(0xff202020),
              400: Color(0xff202020),
              500: Color(0xff202020),
            },
          ),
          secondary: const MaterialColor(
            0xffA882DD,
            <int, Color>{
              100: Color(0xffF6F3FC),
              200: Color(0xffE5DAF5),
              300: Color(0xffDCCDF1),
              400: Color(0xffCBB4EB),
              500: Color(0xffA882DD),
              600: Color(0xff8B6AB9),
              700: Color(0xff6F5396),
              800: Color(0xff523B72),
              900: Color(0xff36244F),
              1000: Color(0xff27183D),
            },
          ),
          onSecondary: const Color(0xff202020),
          tertiary: const MaterialColor(
              0xff70D6FF,
              <int, Color>{
                100: Color(0xffE2F7FF),
                200: Color(0xffC6EFFF),
                300: Color(0xffA9E6FF),
                400: Color(0xff8DDEFF),
                500: Color(0xff70D6FF),
                600: Color(0xff5AB5DA),
                700: Color(0xff4395B5),
                800: Color(0xff2D7491),
                900: Color(0xff16546C),
                1000: Color(0xff003347),
              }),
          surface: const Color(0xff202020),
          onSurface: const Color(0xffffffff),
          error: const MaterialColor(
            0xffFC623C,
            <int, Color>{
              100: Color(0xffFEEBD8),
              200: Color(0xffFEB289),
              300: Color(0xffFC623C),
              400: Color(0xffB5251E),
              500: Color(0xff780B16),
            },
          ),
          onError: Colors.black,
        ),
      );
}

extension MaterialExtensions on MaterialColor {
  Color get shade1000 => this[1000]!;
}
