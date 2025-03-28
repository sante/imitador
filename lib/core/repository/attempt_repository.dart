import 'dart:async';

import 'package:imitador/core/source/attempt/attempt_local_source.dart';
import 'package:imitador/core/source/attempt/attempt_remote_source.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:stock/stock.dart';

class AttemptRepository {
  final AttemptLocalSource attemptLocalSource;
  final AttemptRemoteSource attemptRemoteSource;

  final Stock<dynamic, List<Attempt>> _store;

  AttemptRepository(
    this.attemptLocalSource,
    this.attemptRemoteSource,
  ) : _store = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => attemptRemoteSource.getAttempts(),
          ),
          sourceOfTruth: SourceOfTruth<dynamic, List<Attempt>>(
            reader: (_) => attemptLocalSource.getElementsStream(),
            writer: (_, value) =>
                attemptLocalSource.replaceAttempts(value ?? []),
          ),
        );

  Future<void> refreshAttempts() => _store.fresh(null);

  Future<void> saveAttempt(Attempt attempt) =>
      attemptRemoteSource.postAttempt(attempt);

  Stream<List<Attempt>?> getAttempts() => _store
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());

  Stream<List<Attempt>> getSessionAttempts(String sessionId) => _store
      .stream(null)
      .where((event) => event.isData)
      .where((event) => event
          .requireData()
          .any((element) => element.gameSessionId == sessionId))
      .map((event) => event.requireData());
}
