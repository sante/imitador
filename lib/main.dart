import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:imitador/core/common/config.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/ui/main/main_screen.dart';

Future main() async {
  await runZonedGuarded(
        () async {
      await initSdks();
      runApp(const MyApp());
    },
        (exception, stackTrace) =>
        Logger.fatal(error: exception, stackTrace: stackTrace),
  );
}

@visibleForTesting
Future initSdks() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Logger.init();
  await Config.initialize();
  Hive.init(Config.appDirectoryPath);

  await Future.wait([
    DiProvider.init(),
    _initFirebaseSdks(),
  ]);
}

// ignore: avoid-redundant-async
Future _initFirebaseSdks() async {
  // TODO: Add Crashlytics, Analytics and other sdks that the project needs
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(1440, 1024),
    minTextAdapt: false,
    splitScreenMode: true,
    builder: (_, __) => const MainScreen(),
  );
}
