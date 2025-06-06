import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/dividers.dart';
import 'package:imitador/ui/theme/components/inputs.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';

import 'settings_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SettingsCubit(context),
        child: _SettingsContentScreen(),
      );
}

class _SettingsContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GlobalSectionCubit, GlobalSectionState>(
        builder: (context, state) => MotionScaffold(
          backRoute: const WelcomeRoute(),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SizedBox(
                width: 604.w,
                child: SheetContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.h,
                      horizontal: 72.w,
                    ),
                    child: Column(
                      spacing: 40.h,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.localizations.settings_title,
                          style: context.theme.textStyles.headlineLarge,
                        ),
                        BlocBuilder<SettingsCubit, SettingsState>(
                          builder: (context, settingsState) {
                            final languageItems = [
                              DropdownMenuItem(
                                value: 'es',
                                child: Text(
                                    context.localizations.language_spanish,
                                    style: context.theme.textStyles.bodyLarge
                                        ?.copyWith(color: Colors.white)),
                              ),
                              DropdownMenuItem(
                                value: 'en',
                                child: Text(
                                    context.localizations.language_english,
                                    style: context.theme.textStyles.bodyLarge
                                        ?.copyWith(color: Colors.white)),
                              ),
                            ];

                            return Column(
                              spacing: 20.h,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.localizations.language_label,
                                      style: context.theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 8.h),
                                    SizedBox(
                                      width: 460.w,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        icon: PhosphorIcon(
                                          PhosphorIcons.caretDown(),
                                          color: context
                                              .theme.colorScheme.onPrimary,
                                        ),
                                        style: context
                                            .theme.textStyles.bodyLarge
                                            ?.copyWith(
                                          color: context
                                              .theme.colorScheme.onPrimary,
                                        ),
                                        value: settingsState.selectedLanguage,
                                        hint: Text(context.localizations
                                            .language_select_hint),
                                        items: languageItems,
                                        selectedItemBuilder: (context) => [
                                          DropdownMenuItem(
                                            value: 'es',
                                            child: Text(
                                              context.localizations
                                                  .language_spanish,
                                              style: context
                                                  .theme.textStyles.bodyLarge
                                                  ?.copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'en',
                                            child: Text(
                                              context.localizations
                                                  .language_english,
                                              style: context
                                                  .theme.textStyles.bodyLarge
                                                  ?.copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          if (value != null) {
                                            context
                                                .read<SettingsCubit>()
                                                .setSelectedLanguage(value);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: PrimaryButton(
                                    onPressed:
                                        settingsState.selectedLanguage == null
                                            ? null
                                            : () => context
                                                .read<SettingsCubit>()
                                                .saveLanguagePreference(),
                                    label: context
                                        .localizations.save_selection_button,
                                    leadingIcon: PhosphorIcons.floppyDisk(),
                                  ),
                                ),
                                if (settingsState.saveSuccess)
                                  Text(
                                    context.localizations
                                        .language_preference_saved,
                                    style: context.theme.textStyles.bodyMedium
                                        ?.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const DarkHorizontalDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 40.h,
                          children: [
                            Text(
                              state.usingMicrobit
                                  ? context.localizations.sensor_connected
                                  : context.localizations.connect_sensor_title,
                              style: context.theme.textStyles.headlineSmall,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: PrimaryButton(
                                onPressed: state.usingMicrobit
                                    ? null
                                    : () {
                                        context.router
                                            .push(const MicrobitSetupRoute());
                                      },
                                label: context.localizations.connect_button,
                                leadingIcon: PhosphorIcons.usb(),
                              ),
                            ),
                          ],
                        ),
                        if (state.user != null) ...[
                          const DarkHorizontalDivider(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SecondaryButton(
                              label: context.localizations.log_out,
                              onPressed: () async {
                                await context
                                    .read<GlobalSectionCubit>()
                                    .logOut();
                                // TODO FIXME: Probable race condition
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                if (context.mounted) {
                                  context.router.replace(const WelcomeRoute());
                                }
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
