import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/helper/design_system_helper.dart';
import 'package:imitador/ui/theme/app_buttons.dart';
import 'package:imitador/ui/theme/app_color_scheme.dart';
import 'package:imitador/ui/theme/app_dimensions.dart';
import 'package:imitador/ui/theme/app_text_styles.dart';
import 'package:imitador/ui/theme/custom_colors.dart';
import 'package:imitador/ui/theme/custom_text_styles.dart';

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    final textTheme = AppTextStyles.getDefaultAppStyles().getThemeData();
    final colors = AppColorScheme.getDefaultColorScheme();
    final customColors = CustomColors.getCustomColors();
    final customTextStyles = CustomTextStyles.getCustomTextStyles(customColors);
    final appDimension = AppDimension.getDefaultDimensions();
    final buttonTheme = AppButtonsStyle.getDefaultButtonTheme(
      textTheme,
      customColors,
      customTextStyles,
      colors,
    );

    return ThemeData(
      extensions: [customColors, customTextStyles, appDimension, buttonTheme],
      primaryColor: colors.primary,
      colorScheme: colors,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(colors.primary),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: colors.surface),
        ),
        titleTextStyle: textTheme.headlineSmall
            ?.copyWith(color: customColors.textColor!.getShade(300))
            .semibold(),
        contentTextStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(400)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(400)),
        filled: false,
        helperStyle: textTheme.bodySmall
            ?.copyWith(color: customColors.textColor!..getShade(300)),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(300)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(100),
          ),
        ),
        fillColor: colors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(200),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.danger!.getShade(300),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: colors.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(200),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: colors.error,
          ),
        ),
        errorStyle: textTheme.labelSmall?.copyWith(color: customColors.danger),
        errorMaxLines: 2,
        hoverColor: colors.primary,
        focusColor: colors.primary,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: textTheme.bodyMedium?.copyWith(
          color: colors.primary,
        ),
        menuStyle: MenuStyle(
          maximumSize: WidgetStateProperty.resolveWith<Size?>(
            (Set<WidgetState> states) => Size(1.sw, 35.h * 6),
          ),
          backgroundColor: getMaterialStatesColors(colors.surface),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.onSurface,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: buttonTheme.filledButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonTheme.outlineButton,
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonTheme.textButton,
      ),
      textTheme: textTheme.apply(
        bodyColor: CustomColors.getCustomColors().textColor,
        displayColor: CustomColors.getCustomColors().textColor!.getShade(500),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        toolbarHeight: 120.h,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: CustomColors.getCustomColors().textColor!.getShade(500),
        ),
      ),
      primaryTextTheme: textTheme,
      checkboxTheme: CheckboxThemeData(
        checkColor: getMaterialStatesColors(colors.primary),
        fillColor:
            getMaterialStatesColors(customColors.textColor!..getShade(100)),
        side: BorderSide(
          width: 2,
          color: customColors.textColor!.getShade(400),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            getMaterialStatesColors(customColors.textColor!.getShade(400)),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: buttonTheme.secondaryFilledButton.copyWith(
          fixedSize: WidgetStatePropertyAll(Size(56.w, 48.h)),
        ),
      ),
    );
  }
}

extension ThemeExtensions on ThemeData {
  CustomColors get customColors => extension<CustomColors>()!;

  AppDimension get dimensions => extension<AppDimension>()!;

  CustomTextStyles get customTextStyles => extension<CustomTextStyles>()!;

  TextTheme get textStyles => primaryTextTheme;

  AppButtonsStyle get buttonsStyle => extension<AppButtonsStyle>()!;
}
