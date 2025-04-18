import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/ui/router/app_router.dart';
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
        create: (_) => SettingsCubit(),
        child: _SettingsContentScreen(),
      );
}

class _SettingsContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MotionScaffold(
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
                        "Configuración",
                        style: context.theme.textStyles.headlineLarge,
                      ),
                      MotionDropDown(
                        value: null,
                        items: const ["Español", "Inglés"],
                        hint: "Seleccione un idioma",
                        label: "Idioma",
                        onChanged: (_) {},
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryButton(
                          onPressed: () {},
                          label: "Guardar selección",
                          leadingIcon: PhosphorIcons.floppyDisk(),
                        ),
                      ),
                      const DarkHorizontalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 40.h,
                        children: [
                          Text(
                            "Conectar sensor",
                            style: context.theme.textStyles.headlineSmall,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: PrimaryButton(
                              onPressed: () {
                                context.router.push(const MicrobitSetupRoute());
                              },
                              label: "Conectar",
                              leadingIcon: PhosphorIcons.usb(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
