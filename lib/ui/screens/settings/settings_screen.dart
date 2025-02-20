import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_theme.dart';

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.surface,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: context.theme.colorScheme.primary,
            ),
            onPressed: () async {
              final router = context.router;
              final popped = await router.maybePopTop();
              if (!popped) {
                router.replace(const WelcomeRoute());
              }
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xFFEDF0F7),
              ),
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
                      style: context.theme.textStyles.titleLarge,
                    ),
                    DropdownButton(
                      items: ["Español", "Inglés"]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (_) {},
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Guardar selección"),
                    ),
                    Container(
                      color: context.theme.primaryColor.getShade(200),
                      width: 460.w,
                      height: 2.h,
                    ),
                    Text(
                      "Conectar sensor",
                      style: context.theme.textStyles.titleLarge,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Conectar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
