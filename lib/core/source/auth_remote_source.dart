import 'package:imitador/core/common/model/service/auth_models.dart';
import 'package:imitador/core/common/model/service/service_response.dart';
import 'package:imitador/core/source/common/http_service.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlLogin = 'auth/v1/token';

  AuthRemoteSource(this._httpService);

  Future<SignInResponse> signIn(String email, String password) async =>
      (await _httpService.postAndProcessResponse(
        _urlLogin,
        queryParameters: {'grant_type': 'password'},
        data: SignInRequest(email: email, password: password).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();
}
