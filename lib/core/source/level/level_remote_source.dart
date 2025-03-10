import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:imitador/model/level/level.dart';

class LevelRemoteSource {
  static const _urlGetLevels = '/v1/levels/default';

  final HttpServiceDio _httpService;

  LevelRemoteSource(this._httpService);

  Future<List<Level>> getLevels() => _httpService
      .getAndProcessResponse(
        _urlGetLevels,
        serializer: (listResponse) => (listResponse as List).map((level) {
          level['duration'] = level['duration'] is String
              ? double.parse(level['duration'])
              : level['duration'];
          return Level.fromJson(level);
        }).toList(),
      )
      .then((value) => value.getDataOrThrow());
}
