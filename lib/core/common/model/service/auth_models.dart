import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/user_type.dart';

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

@freezed
sealed class SignUpRequest with _$SignUpRequest {
  @JsonSerializable()
  factory SignUpRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'type') required UserType userType,
  }) = _SignUpRequest;

  factory SignUpRequest.code({
    @JsonKey(name: 'email') required String email,
  }) = _SignUpRequestCode;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
