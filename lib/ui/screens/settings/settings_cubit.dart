import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/common/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  static const String languagePreferenceKey = 'app_language_preference';

  final BuildContext context;

  SettingsCubit(this.context) : super(const SettingsState.state()) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(languagePreferenceKey);
    if (savedLanguage != null) {
      emit(state.copyWith(selectedLanguage: savedLanguage));
    }
  }

  void setSelectedLanguage(String language) {
    emit(state.copyWith(selectedLanguage: language));
  }

  Future<void> saveLanguagePreference() async {
    if (state.selectedLanguage == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languagePreferenceKey, state.selectedLanguage!);

    // Set locale based on selected language code
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    // The selectedLanguage is now directly the locale code ('en' or 'es')
    final locale = Locale(state.selectedLanguage!);
    await localeProvider.setLocale(locale);

    // Optionally notify user of success
    emit(state.copyWith(saveSuccess: true));
    // Reset success flag after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (!isClosed) {
        emit(state.copyWith(saveSuccess: false));
      }
    });
  }
}
