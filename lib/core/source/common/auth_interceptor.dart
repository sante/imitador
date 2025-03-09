import 'dart:io';

import 'package:dio/dio.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/source/auth_local_source.dart';
import 'package:imitador/core/source/auth_remote_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalSource _authLocalSource;

  late final Dio _dio;

  void setDio(Dio dio) {
    _dio = dio;
  }

  AuthInterceptor(this._authLocalSource);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _authLocalSource.getUserToken().first;
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final refreshToken = await _authLocalSource.getRefreshToken().first;
      if (refreshToken != null) {
        try {
          final AuthRemoteSource authRemoteSource = DiProvider.get();
          final response = await authRemoteSource.refresh(refreshToken);
          await _authLocalSource.saveUserToken(response.accessToken);
          await _authLocalSource.saveRefreshToken(response.refreshToken);
          final newOptions = err.requestOptions.copyWith(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer ${response.accessToken}',
            },
          );
          final retriedResponse = await _dio.fetch(newOptions);
          handler.resolve(retriedResponse);
          return;
        } catch (e) {
          await _authLocalSource.saveUserToken(null);
        }
      } else {
        await _authLocalSource.saveUserToken(null);
      }
    }
    handler.next(err);
  }
}
