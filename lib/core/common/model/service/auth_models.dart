import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';

part 'auth_models.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  factory SignInResponse({
    required String accessToken,
    required String refreshToken,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}

@freezed
sealed class SignInRequest with _$SignInRequest {
  @JsonSerializable()
  factory SignInRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'code') required String code,
  }) = _SignInRequest;

  factory SignInRequest.code({
    @JsonKey(name: 'email') required String email,
  }) = _SignInRequestCode;

  factory SignInRequest.refresh({
    @JsonKey(name: 'refreshToken') required String token,
  }) = _SignInRefresh;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
