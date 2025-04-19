import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/helper/design_system_helper.dart';
import 'package:imitador/ui/theme/custom_colors.dart';
import 'package:imitador/ui/theme/custom_text_styles.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle extends ThemeExtension<AppButtonsStyle> {
  final TextTheme _textTheme;
  final CustomColors _customColors;
  final CustomTextStyles _customTextStyles;
  final ColorScheme _colorScheme;
  final Size? _customSize;

  late final ButtonStyle filledButton;
  late final ButtonStyle outlineButton;
  late final ButtonStyle textButton;
  late final ButtonStyle secondaryFilledButton;
  late final ButtonStyle secondaryOutlineButton;
  late final ButtonStyle secondaryTextButton;

  AppButtonsStyle(this._textTheme, this._customColors, this._customTextStyles,
      this._colorScheme,
      [this._customSize]) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    );

    filledButton = FilledButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
      elevation: 0.0,
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      minimumSize: _customSize ?? Size(110.w, 48.h),
    );

    outlineButton = OutlinedButton.styleFrom(
      shape: roundedRectangleBorder,
      side: BorderSide(
        width: 1.r,
        color: _colorScheme.primary,
      ),
      textStyle: _textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
      elevation: 0.0,
      foregroundColor: _colorScheme.primary,
      backgroundColor: _colorScheme.surface,
      shadowColor: _colorScheme.primary,
      minimumSize: _customSize ?? Size(110.w, 48.h),
    );

    textButton = TextButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _customTextStyles.linkMedium,
      elevation: 0.0,
      minimumSize: _customSize ?? Size(110.w, 48.h),
    );

    secondaryFilledButton = filledButton.copyWith(
      backgroundColor: getMaterialStatesColors(_colorScheme.secondary),
      foregroundColor: getMaterialStatesColors(
        _colorScheme.onSecondary,
      ),
      shadowColor: getMaterialStatesColors(_colorScheme.secondary),
      minimumSize: null,
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
          TextTheme textTheme,
          CustomColors customColors,
          CustomTextStyles customTextStyles,
          ColorScheme colorScheme,
          [Size? customSize]) =>
      AppButtonsStyle(
          textTheme, customColors, customTextStyles, colorScheme, customSize);

  @override
  AppButtonsStyle copyWith({Size? customSize}) =>
      AppButtonsStyle.getDefaultButtonTheme(
        _textTheme,
        _customColors,
        _customTextStyles,
        _colorScheme,
        customSize ?? _customSize,
      );

  @override
  AppButtonsStyle lerp(AppButtonsStyle other, double t) {
    if (other is! AppButtonsStyle) {
      return this;
    }
    return AppButtonsStyle(
      _textTheme,
      _customColors,
      _customTextStyles,
      _colorScheme,
      _customSize,
    );
  }
}
