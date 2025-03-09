// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseImpl _$$SignInResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignInResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$SignInResponseImplToJson(
        _$SignInResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$SignInRequestImpl _$$SignInRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignInRequestImpl(
      email: json['email'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignInRequestImplToJson(_$SignInRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$SignInRequestCodeImpl _$$SignInRequestCodeImplFromJson(
        Map<String, dynamic> json) =>
    _$SignInRequestCodeImpl(
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignInRequestCodeImplToJson(
        _$SignInRequestCodeImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'runtimeType': instance.$type,
    };

_$SignInRefreshImpl _$$SignInRefreshImplFromJson(Map<String, dynamic> json) =>
    _$SignInRefreshImpl(
      token: json['refreshToken'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignInRefreshImplToJson(_$SignInRefreshImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.token,
      'runtimeType': instance.$type,
    };
