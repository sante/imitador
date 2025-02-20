import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/helper/design_system_helper.dart';
import 'package:imitador/ui/theme/custom_colors.dart';
import 'package:imitador/ui/theme/custom_text_styles.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle extends ThemeExtension<AppButtonsStyle> {
  final CustomColors _customColors;
  final CustomTextStyles _customTextStyles;
  final ColorScheme _colorScheme;

  late final ButtonStyle filledButton;
  late final ButtonStyle outlineButton;
  late final ButtonStyle textButton;
  late final ButtonStyle secondaryFilledButton;
  late final ButtonStyle secondaryOutlineButton;
  late final ButtonStyle secondaryTextButton;

  AppButtonsStyle(
    this._customColors,
    this._customTextStyles,
    this._colorScheme,
  ) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.2.r),
    );

    filledButton = FilledButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _customTextStyles.buttonLarge.copyWith(fontSize: 21.6.sp),
      elevation: 0.0,
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
    );

    outlineButton = OutlinedButton.styleFrom(
      shape: roundedRectangleBorder,
      side: BorderSide(
        width: 2.4.r,
        color: _colorScheme.primary,
      ),
      textStyle: _customTextStyles.buttonLarge.copyWith(fontSize: 21.6.sp),
      elevation: 0.0,
      foregroundColor: _customColors.textColor,
      backgroundColor: _colorScheme.surface,
    );

    textButton = TextButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _customTextStyles.buttonLarge,
      elevation: 0.0,
    );

    secondaryFilledButton = filledButton.copyWith(
      backgroundColor:
          getMaterialStatesColors(_customColors.textColor!.getShade(200)),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!,
      ),
    );

    secondaryOutlineButton = outlineButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        _colorScheme.surface.getShade(100),
      ),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!.getShade(300),
      ),
      side: getBorderSidesStates(_customColors.textColor!.getShade(300)),
    );

    secondaryTextButton = textButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        Colors.transparent,
      ),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!.getShade(300),
      ),
    );
  }

  static AppButtonsStyle getDefaultButtonTheme(
    CustomColors customColors,
    CustomTextStyles customTextStyles,
    ColorScheme colorScheme,
  ) =>
      AppButtonsStyle(customColors, customTextStyles, colorScheme);

  @override
  AppButtonsStyle copyWith() => AppButtonsStyle.getDefaultButtonTheme(
        _customColors,
        _customTextStyles,
        _colorScheme,
      );

  @override
  AppButtonsStyle lerp(AppButtonsStyle other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }
    return AppButtonsStyle(
      _customColors,
      _customTextStyles,
      _colorScheme,
    );
  }
}
