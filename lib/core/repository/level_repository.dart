import 'dart:async';

import 'package:imitador/core/source/level/level_local_source.dart';
import 'package:imitador/core/source/level/level_remote_source.dart';
import 'package:imitador/model/level/level.dart';
import 'package:stock/stock.dart';

class LevelRepository {
  final LevelLocalSource _levelLocalSource;
  final LevelRemoteSource _levelRemoteSource;

  final Stock<dynamic, List<Level>> _store;

  LevelRepository(
    this._levelLocalSource,
    this._levelRemoteSource,
  ) : _store = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _levelRemoteSource.getLevels(),
          ),
          sourceOfTruth: SourceOfTruth<dynamic, List<Level>>(
            reader: (_) => _levelLocalSource.getElementsStream(),
            writer: (_, value) =>
                _levelLocalSource.replaceLevels(value ?? []),
          ),
        );

  Future<List<Level>?> getDirectLevels() => _levelRemoteSource.getLevels();

  Stream<List<Level>?> getLevels() => _store
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());
}
