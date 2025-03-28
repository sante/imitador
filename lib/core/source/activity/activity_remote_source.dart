import 'package:imitador/core/common/logger.dart';
import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:imitador/model/activity/activity.dart';

class ActivityRemoteSource {
  static const _urlGetActivities = '/v1/activities/default';
  static const _urlGetActivity = '/v1/activities';

  final HttpServiceDio _httpService;

  ActivityRemoteSource(this._httpService);

  Future<List<Activity>> getActivities() => _httpService.getAndProcessResponse(
        _urlGetActivities,
        serializer: (listResponse) {
          Logger.d(
              'ActivityRemoteSource.getActivities: listResponse: ${(listResponse as List).length}');
          final activities = (listResponse).map((activity) {
            final parsed = Activity.fromJson(activity);
            Logger.d('ActivityRemoteSource.getActivities: parsed: ${parsed}');
            return parsed;
          }).toList();

          Logger.d(
              'ActivityRemoteSource.getActivities: activities: ${activities.length}');
          return activities;
        },
      ).then((value) => value.getDataOrThrow());

  Future<Activity> getActivityById(String id) => _httpService
      .getAndProcessResponse(
        '$_urlGetActivity/$id',
        serializer: (response) => Activity.fromJson(response),
      )
      .then((value) => value.getDataOrThrow());
}
