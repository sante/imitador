import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:imitador/core/common/locale_provider.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/ui/resources.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = DiProvider.get<AppRouter>();
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return MaterialApp.router(
            theme: AppTheme.provideAppTheme(context),
            locale: localeProvider.locale,
            routerConfig: router.config(
                reevaluateListenable: router.authReevaluateListenable),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) {
              Resources.setup(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
