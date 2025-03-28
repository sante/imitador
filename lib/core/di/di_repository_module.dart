import 'package:imitador/core/repository/activity_repository.dart';
import 'package:imitador/core/repository/attempt_repository.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/core/repository/level_repository.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/core/source/activity/activity_local_source.dart';
import 'package:imitador/core/source/activity/activity_remote_source.dart';
import 'package:imitador/core/source/attempt/attempt_local_source.dart';
import 'package:imitador/core/source/attempt/attempt_remote_source.dart';
import 'package:imitador/core/source/auth_local_source.dart';
import 'package:imitador/core/source/auth_remote_source.dart';
import 'package:imitador/core/source/common/auth_interceptor.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:get_it/get_it.dart';
import 'package:imitador/core/source/game_session_local_source.dart';
import 'package:imitador/core/source/game_session_remote_source.dart';
import 'package:imitador/core/source/level/level_local_source.dart';
import 'package:imitador/core/source/level/level_remote_source.dart';

class RepositoryDiModule {
  RepositoryDiModule._privateConstructor();

  static final RepositoryDiModule _instance =
      RepositoryDiModule._privateConstructor();

  factory RepositoryDiModule() => _instance;

  void setupModule(GetIt locator) {
    locator
      .._setupProvidersAndUtils()
      .._setupSources()
      .._setupRepositories();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupProvidersAndUtils() {
    registerLazySingleton(() => HttpServiceDio([AuthInterceptor(get())]));
  }

  void _setupRepositories() {
    registerLazySingleton(() => SessionRepository(get(), get()));
    registerLazySingleton(() => LevelRepository(get(), get()));
    registerLazySingleton(() => ActivityRepository(get(), get()));
    registerLazySingleton(() => GameSessionRepository(get(), get()));
    registerLazySingleton(() => AttemptRepository(get(), get()));
  }

  void _setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
    registerLazySingleton(() => LevelRemoteSource(get()));
    registerLazySingleton(() => LevelLocalSource());
    registerLazySingleton(() => AttemptRemoteSource(get()));
    registerLazySingleton(() => AttemptLocalSource());
    registerLazySingleton(() => ActivityRemoteSource(get()));
    registerLazySingleton(() => ActivityLocalSource());
    registerLazySingleton(() => GameSessionRemoteSource(get()));
    registerLazySingleton(() => GameSessionLocalSource(get()));
  }
}
