import 'dart:async';

import 'package:hive/hive.dart';
import 'package:imitador/core/common/model/service/auth_models.dart';
import 'package:imitador/core/source/auth_local_source.dart';
import 'package:imitador/core/source/auth_remote_source.dart';
import 'package:imitador/core/source/game_session_local_source.dart';
import 'package:imitador/core/source/game_session_remote_source.dart';
import 'package:imitador/model/enum/authentication_status.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/model/user/user.dart';

class GameSessionRepository {
  final GameSessionRemoteSource _gameSessionRemoteSource;
  final GameSessionLocalSource _gameSessionLocalSource;

  GameSessionRepository(
    this._gameSessionRemoteSource,
    this._gameSessionLocalSource,
  );

  Stream<String?> getGameSessionCode() => _gameSessionLocalSource.getGameSessionCode();

  Future<void> validateGameSessionCode(String code) async {
    await _gameSessionRemoteSource.validateCode(code);
    await _gameSessionLocalSource.saveGameSessionCode(code);
  }

  Future<void> clearGameSessionCode() async {
    await _gameSessionLocalSource.saveGameSessionCode(null);
  }
}
