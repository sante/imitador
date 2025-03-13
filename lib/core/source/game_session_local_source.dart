import 'package:imitador/core/common/store/secure_storage_cached_source.dart';
import 'package:imitador/core/source/common/local_shared_preferences_storage.dart';
import 'package:stock/stock.dart';

class GameSessionLocalSource {
  static const _storageGameSessionPrefix = 'GameSessionLocalSource';
  static const _keySessionCode = '$_storageGameSessionPrefix.code';

  late SourceOfTruth<String, String> _gameSessionCodeStorage;

  GameSessionLocalSource(LocalSharedPreferencesStorage storage) {
    final secureStorage = SharedPreferencesSourceOfTruth(storage);
    _gameSessionCodeStorage = secureStorage;
  }

  Stream<String?> getGameSessionCode() => _gameSessionCodeStorage.reader(_keySessionCode);

  Future<void> saveGameSessionCode(String? code) =>
      _gameSessionCodeStorage.write(_keySessionCode, code);

}
