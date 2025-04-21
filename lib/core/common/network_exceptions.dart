import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
sealed class NetworkException with _$NetworkException implements Exception {
  const factory NetworkException.unauthorizedRequest(body) =
      UnauthorizedRequest;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.notFound(String reason) = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(int? code, String? error) =
      DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  static NetworkException handleResponse(int? statusCode, dynamic body) {
    String? message;
    if (body is Map && body['message'] != null) {
      message = body['message'].toString();
    }
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkException.unauthorizedRequest(message ?? body);
      case 404:
        return NetworkException.notFound(message ?? 'No encontrado');
      case 409:
        return const NetworkException.conflict();
      case 408:
        return const NetworkException.noInternetConnection();
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        return NetworkException.defaultError(
          statusCode,
          message ?? (body is String ? body : body.toString()),
        );
    }
  }

  static NetworkException getDioException(error) {
    if (error is Exception) {
      try {
        NetworkException networkExceptions;
        if (error is DioException) {
          networkExceptions = switch (error.type) {
            DioExceptionType.connectionTimeout ||
            DioExceptionType.cancel ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.badCertificate ||
            DioExceptionType.unknown ||
            DioExceptionType.receiveTimeout ||
            DioExceptionType.connectionError =>
              const NetworkException.noInternetConnection(),
            DioExceptionType.badResponse => NetworkException.handleResponse(
                error.response?.statusCode,
                error.response?.data,
              ),
          };
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          networkExceptions = const NetworkException.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      return error.toString().contains('is not a subtype of')
          ? const NetworkException.unableToProcess()
          : const NetworkException.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkException networkExceptions) =>
      switch (networkExceptions) {
        NotImplemented() => 'No implementado',
        InternalServerError() => 'Error del servidor',
        NotFound(reason: final reason) => reason,
        ServiceUnavailable() => 'Servicio no disponible',
        MethodNotAllowed() => 'Método no autorizado',
        BadRequest() => 'Solicitud incorrecta',
        UnauthorizedRequest(body: final body) =>
          body?.toString() ?? 'No autorizado',
        UnexpectedError() => 'Error inesperado',
        NoInternetConnection() => 'No hay conexión a internet',
        Conflict() => 'Error debido a un conflicto',
        UnableToProcess() => 'No se puede procesar la data',
        DefaultError(error: final String? error) =>
          error ?? 'Error desconocido. Intente nuevamente en unos minutos.',
        FormatException() => 'Error de formato',
        NotAcceptable() => 'No aceptable',
      };
}
