import 'package:imitador/core/common/model/service/game_session_models.dart';
import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';

class GameSessionRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlJoin = '/v1/gameSessions/join';
  static const _urlCreate = '/v1/gameSessions/create';

  GameSessionRemoteSource(this._httpService);

  Future<GameSessionJoinResponse> joinGameSessionAPI(String code) async =>
      (await _httpService.postAndProcessResponse(
        _urlJoin,
        data: GameSessionJoinRequest(code: code).toJson(),
        serializer: (data) => GameSessionJoinResponse.fromJson(data),
      ))
          .getDataOrThrow();

  Future<GameSessionJoinResponse> createGameSession(String activityId, String teacherId) async => (await _httpService.postAndProcessResponse(
    _urlCreate,
    data: GameSessionCreateRequest(activityId: activityId, teacherId: teacherId).toJson(),
    serializer: (data) => GameSessionJoinResponse.fromJson(data),
  )).getDataOrThrow();
}
