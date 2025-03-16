import 'package:imitador/core/common/store/secure_storage_cached_source.dart';
import 'package:imitador/core/source/common/local_shared_preferences_storage.dart';
import 'package:stock/stock.dart';

class GameSessionLocalSource {
  static const _storageGameSessionPrefix = 'GameSessionLocalSource';
  static const _keySessionCode = '$_storageGameSessionPrefix.code';
  static const _gameIdKey = '$_storageGameSessionPrefix.gameId';

  late SourceOfTruth<String, String> _gameSessionCodeStorage;

  GameSessionLocalSource(LocalSharedPreferencesStorage storage) {
    final secureStorage = SharedPreferencesSourceOfTruth(storage);
    _gameSessionCodeStorage = secureStorage;
  }

  Stream<String?> getGameSessionCode() =>
      _gameSessionCodeStorage.reader(_keySessionCode);

  Future<void> saveGameSessionCode(String? code) =>
      _gameSessionCodeStorage.write(_keySessionCode, code);

  Future<void> saveGameId({
    required String gameId,
  }) =>
      _gameSessionCodeStorage.write(_gameIdKey, gameId);

  Stream<String?> getGameId() => _gameSessionCodeStorage.reader(_gameIdKey);
}
