import 'dart:math';
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color getShade(int shade) => this is MaterialColor
      ? (this as MaterialColor)[shade]!
      : _generateMaterialColor();

  MaterialColor _generateMaterialColor() => MaterialColor(value, {
        50: _tintColor(0.9),
        100: _tintColor(0.8),
        200: _tintColor(0.6),
        300: _tintColor(0.4),
        400: _tintColor(0.2),
        500: this,
        600: _shadeColor(0.1),
        700: _shadeColor(0.2),
        800: _shadeColor(0.3),
        900: _shadeColor(0.4),
      });

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color _tintColor(double factor) => Color.fromRGBO(
        _tintValue(red, factor),
        _tintValue(green, factor),
        _tintValue(blue, factor),
        1,
      );

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(double factor) => Color.fromRGBO(
        _shadeValue(red, factor),
        _shadeValue(green, factor),
        _shadeValue(blue, factor),
        1,
      );
}
