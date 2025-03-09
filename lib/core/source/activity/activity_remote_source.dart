import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:imitador/model/activity/activity.dart';

class ActivityRemoteSource {
  static const _urlGetActivities = '/v1/activities';

  final HttpServiceDio _httpService;

  ActivityRemoteSource(this._httpService);

  Future<List<Activity>> getActivities() => _httpService
      .getAndProcessResponse(
        _urlGetActivities,
        serializer: (listResponse) => (listResponse as List)
            .map((activity) => Activity.fromJson(activity))
            .toList(),
      )
      .then((value) => value.getDataOrThrow());
}
