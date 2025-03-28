import 'dart:async';
import 'package:imitador/core/common/logger.dart';
import 'package:stock/stock.dart';
import 'package:imitador/core/common/store/secure_storage_cached_source.dart';
import 'package:imitador/core/source/common/local_shared_preferences_storage.dart';
import 'package:imitador/core/source/common/hive_base_source.dart';
import 'package:imitador/model/game_session/game_session.dart';

class GameSessionLocalSource extends HiveBaseSource<String, GameSession> {
  static const _storageGameSessionPrefix = 'GameSessionLocalSource';
  static const _keySessionCode = '$_storageGameSessionPrefix.code';
  static const _keyGameId = '$_storageGameSessionPrefix.gameId';
  static const _keyCreatorId = '$_storageGameSessionPrefix.creatorId';

  late SourceOfTruth<String, String> _gameSessionCodeStorage;
  late SourceOfTruth<String, String> _gameIdStorage;

  GameSessionLocalSource(LocalSharedPreferencesStorage storage)
      : super(
          dbParser: (gameSession) => gameSession.toJson(),
          modelParser: (json) => GameSession.fromJson(json),
        ) {
    final secureStorage = SharedPreferencesSourceOfTruth(storage);
    _gameSessionCodeStorage = secureStorage;
    _gameIdStorage = secureStorage;
  }

  Stream<String?> getGameSessionCode() =>
      _gameSessionCodeStorage.reader(_keySessionCode);

  Stream<String?> getGameId() => _gameIdStorage.reader(_keyGameId);

  Stream<String?> getCreatorId() => _gameIdStorage.reader(_keyCreatorId);

  Future<void> saveGameSessionCode(String? code) =>
      _gameSessionCodeStorage.write(_keySessionCode, code);

  Future<void> saveGameId(String? gameId) =>
      _gameIdStorage.write(_keyGameId, gameId);

  Future<void> saveCreatorId(String? creatorId) =>
      _gameIdStorage.write(_keyCreatorId, creatorId);

  Future<void> processSocketEvent(
      ServerGameEvents event, Map<String, dynamic> data) async {
    try {
      final gameSession = GameSession.fromJson(data);

      await saveGameSessionCode(gameSession.code);
      await saveGameId(gameSession.id);

      Logger.d('Evento $event procesado y guardado correctamente');
    } catch (e) {
      Logger.e('Error al procesar evento $event: $e');
    }
  }

  Future<void> clearGameSessionData() async {
    try {
      await saveGameSessionCode(null);
      await saveGameId(null);
      Logger.d('Datos de sesión limpiados correctamente');
    } catch (e) {
      Logger.e('Error al limpiar datos de sesión: $e');
      rethrow;
    }
  }
}
