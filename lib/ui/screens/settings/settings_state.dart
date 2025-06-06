part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.state({
    String? selectedLanguage,
    @Default(false) bool saveSuccess,
  }) = _SettingsState;
}
