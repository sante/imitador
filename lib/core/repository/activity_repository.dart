import 'dart:async';

import 'package:imitador/core/source/activity/activity_local_source.dart';
import 'package:imitador/core/source/activity/activity_remote_source.dart';
import 'package:imitador/core/source/level/level_local_source.dart';
import 'package:imitador/core/source/level/level_remote_source.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/level/level.dart';
import 'package:stock/stock.dart';

class ActivityRepository {
  final ActivityLocalSource _activityLocalSource;
  final ActivityRemoteSource _activityRemoteSource;

  final Stock<dynamic, List<Activity>> _store;

  ActivityRepository(
    this._activityLocalSource,
    this._activityRemoteSource,
  ) : _store = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _activityRemoteSource.getActivities(),
          ),
          sourceOfTruth: SourceOfTruth<dynamic, List<Activity>>(
            reader: (_) => _activityLocalSource.getElementsStream(),
            writer: (_, value) =>
                _activityLocalSource.replaceActivities(value ?? []),
          ),
        );

  Future<List<Activity>?> getDirectActivities() =>
      _activityRemoteSource.getActivities();

  Future<Activity> getActivityById(String id) async {
    final activities = await _store.fresh(null);
    return activities.firstWhere((element) => element.id == id);
  }

  void refresh() => _store.fresh(null);

  Stream<List<Activity>?> getActivities() => _store
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());
}
