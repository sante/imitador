import 'package:imitador/core/common/model/service/auth_models.dart';
import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';
import 'package:imitador/model/enum/user_type.dart';
import 'package:imitador/model/user/user.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlLogin = '/v1/auth/login';
  static const _urlLoginRequest = '/v1/auth/login/request';
  static const _urlSignUp = '/v1/auth/register';
  static const _urlSignUpRequest = '/v1/auth/register/request';
  static const _urlRefresh = '/v1/auth/refresh';
  static const _urlUser = '/v1/users/me';

  AuthRemoteSource(this._httpService);

  Future<void> requestSignInCode(String email) async => await _httpService.post(
        _urlLoginRequest,
        data: SignInRequest.code(email: email).toJson(),
      );

  Future<void> requestSignUpCode(String email) async => await _httpService.post(
        _urlSignUpRequest,
        data: SignUpRequest.code(email: email).toJson(),
      );

  Future<SignInResponse> signUp(
    String email,
    String name,
    String code,
    UserType userType,
  ) async =>
      (await _httpService.postAndProcessResponse(
        _urlSignUp,
        data: SignUpRequest(
          email: email,
          name: name,
          code: code,
          userType: userType,
        ).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();

  Future<SignInResponse> refresh(String refreshToken) async =>
      (await _httpService.postAndProcessResponse(
        _urlRefresh,
        data: SignInRequest.refresh(token: refreshToken).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();

  Future<SignInResponse> signIn(String email, String code) async =>
      (await _httpService.postAndProcessResponse(
        _urlLogin,
        data: SignInRequest(email: email, code: code).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();

  Future<User> getUser() async => (await _httpService.getAndProcessResponse(
        _urlUser,
        serializer: (data) => User.fromJson(data),
      ))
          .getDataOrThrow();
}
