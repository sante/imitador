import 'dart:async';

import 'package:imitador/core/source/activity/activity_local_source.dart';
import 'package:imitador/core/source/activity/activity_remote_source.dart';
import 'package:imitador/core/source/level/level_local_source.dart';
import 'package:imitador/core/source/level/level_remote_source.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/model/level/level.dart';
import 'package:stock/stock.dart';

class ActivityRepository {
  final ActivityLocalSource _levelLocalSource;
  final ActivityRemoteSource _levelRemoteSource;

  final Stock<dynamic, List<Activity>> _store;

  ActivityRepository(
    this._levelLocalSource,
    this._levelRemoteSource,
  ) : _store = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _levelRemoteSource.getActivities(),
          ),
          sourceOfTruth: SourceOfTruth<dynamic, List<Activity>>(
            reader: (_) => _levelLocalSource.getElementsStream(),
            writer: (_, value) =>
                _levelLocalSource.replaceActivities(value ?? []),
          ),
        );

  Stream<List<Activity>?> getActivities() => _store
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());
}
