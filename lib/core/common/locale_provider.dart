import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const String _localeKey = 'app_locale';

  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? localeString = prefs.getString(_localeKey);

    if (localeString != null) {
      setLocale(Locale(localeString));
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;

    _locale = locale;

    // Save to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);

    notifyListeners();
  }

  Future<void> clearLocale() async {
    _locale = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);

    notifyListeners();
  }
}
