import 'package:imitador/core/source/common/http_service.dart';

class GameSessionRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlValidate = '/v1/gameSessions';

  GameSessionRemoteSource(this._httpService);

  Future<void> validateCode(String code) async => await _httpService.get(
        "$_urlValidate/$code",
      );
}
