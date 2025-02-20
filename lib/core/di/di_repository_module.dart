import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/core/source/auth_local_source.dart';
import 'package:imitador/core/source/auth_remote_source.dart';
import 'package:imitador/core/source/common/auth_interceptor.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:get_it/get_it.dart';

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
  }

  void _setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
  }
}
