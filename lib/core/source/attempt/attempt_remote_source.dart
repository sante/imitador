import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:imitador/model/attempt/attempt.dart';

class AttemptRemoteSource {
  static const _urlGetAttempts = '/v1/attempts';
  static const _urlSaveAttempt = '/v1/attempts';

  final HttpServiceDio _httpService;

  AttemptRemoteSource(this._httpService);

  Future<List<Attempt>> getAttempts() => _httpService
      .getAndProcessResponse(
        _urlGetAttempts,
        serializer: (listResponse) => (listResponse as List).map((attempt) {
          return Attempt.fromJson(attempt);
        }).toList(),
      )
      .then((value) => value.getDataOrThrow());

  Future<void> postAttempt(Attempt attempt) => _httpService.post(
        _urlSaveAttempt,
        data: attempt.toJson(),
      );
}
