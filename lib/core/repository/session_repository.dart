import 'dart:async';

import 'package:hive/hive.dart';
import 'package:imitador/core/common/model/service/auth_models.dart';
import 'package:imitador/core/source/auth_local_source.dart';
import 'package:imitador/core/source/auth_remote_source.dart';
import 'package:imitador/model/enum/authentication_status.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/model/user/user.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;

  SessionRepository(
    this._authLocalSource,
    this._authRemoteSource,
  );

  Stream<AuthenticationStatus> get status =>
      _authLocalSource.getUserToken().map(
            (token) => token == null
                ? AuthenticationStatus.unauthenticated
                : AuthenticationStatus.authenticated,
          );

  Stream<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> requestSignInCode(String email) async {
    await _authRemoteSource.requestSignInCode(email);
  }

  Future<void> requestSignUpCode(String email) async {
    await _authRemoteSource.requestSignUpCode(email);
  }

  Future<void> signInUser({
    required String email,
    required String code,
  }) async {
    final response = await _authRemoteSource.signIn(email, code);
    saveSessionInfo(response);
  }

  Future<void> signUpUser({
    required String email,
    required String name,
    required String code,
    required UserType userType,
  }) async {
    final response = await _authRemoteSource.signUp(
      email,
      name,
      code,
      userType,
    );
    saveSessionInfo(response);
  }

  Future<void> saveSessionInfo(SignInResponse response) async {
    await _authLocalSource.saveUserToken(response.accessToken);
    await _authLocalSource.saveRefreshToken(response.refreshToken);
    final user = await _authRemoteSource.getUser();
    await _authLocalSource.saveUserInfo(user);
  }

  Future<void> refresh() async {
    final refreshToken = await _authLocalSource.getRefreshToken().first;
    if (refreshToken == null) {
      return;
    }
    try {
      final response = await _authRemoteSource.refresh(refreshToken);
      saveSessionInfo(response);
    } catch (e) {
      await logOut();
    }
  }

  Future<void> logOut() async {
    await Hive.deleteFromDisk();
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveRefreshToken(null);
    await _authLocalSource.saveUserInfo(null);
  }
}
