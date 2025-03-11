// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return _SignInResponse.fromJson(json);
}

/// @nodoc
mixin _$SignInResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResponseCopyWith<SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseCopyWith<$Res> {
  factory $SignInResponseCopyWith(
          SignInResponse value, $Res Function(SignInResponse) then) =
      _$SignInResponseCopyWithImpl<$Res, SignInResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$SignInResponseCopyWithImpl<$Res, $Val extends SignInResponse>
    implements $SignInResponseCopyWith<$Res> {
  _$SignInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInResponseImplCopyWith<$Res>
    implements $SignInResponseCopyWith<$Res> {
  factory _$$SignInResponseImplCopyWith(_$SignInResponseImpl value,
          $Res Function(_$SignInResponseImpl) then) =
      __$$SignInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$SignInResponseImplCopyWithImpl<$Res>
    extends _$SignInResponseCopyWithImpl<$Res, _$SignInResponseImpl>
    implements _$$SignInResponseImplCopyWith<$Res> {
  __$$SignInResponseImplCopyWithImpl(
      _$SignInResponseImpl _value, $Res Function(_$SignInResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$SignInResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseImpl implements _SignInResponse {
  _$SignInResponseImpl({required this.accessToken, required this.refreshToken});

  factory _$SignInResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'SignInResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      __$$SignInResponseImplCopyWithImpl<_$SignInResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseImplToJson(
      this,
    );
  }
}

abstract class _SignInResponse implements SignInResponse {
  factory _SignInResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$SignInResponseImpl;

  factory _SignInResponse.fromJson(Map<String, dynamic> json) =
      _$SignInResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _SignInRequest.fromJson(json);
    case 'code':
      return _SignInRequestCode.fromJson(json);
    case 'refresh':
      return _SignInRefresh.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SignInRequest',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SignInRequest {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
    required TResult Function(@JsonKey(name: 'refreshToken') String token)
        refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
    TResult? Function(@JsonKey(name: 'refreshToken') String token)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    TResult Function(@JsonKey(name: 'refreshToken') String token)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignInRequest value) $default, {
    required TResult Function(_SignInRequestCode value) code,
    required TResult Function(_SignInRefresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignInRequest value)? $default, {
    TResult? Function(_SignInRequestCode value)? code,
    TResult? Function(_SignInRefresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignInRequest value)? $default, {
    TResult Function(_SignInRequestCode value)? code,
    TResult Function(_SignInRefresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestCopyWith<$Res> {
  factory $SignInRequestCopyWith(
          SignInRequest value, $Res Function(SignInRequest) then) =
      _$SignInRequestCopyWithImpl<$Res, SignInRequest>;
}

/// @nodoc
class _$SignInRequestCopyWithImpl<$Res, $Val extends SignInRequest>
    implements $SignInRequestCopyWith<$Res> {
  _$SignInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInRequestImplCopyWith<$Res> {
  factory _$$SignInRequestImplCopyWith(
          _$SignInRequestImpl value, $Res Function(_$SignInRequestImpl) then) =
      __$$SignInRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'code') String code});
}

/// @nodoc
class __$$SignInRequestImplCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res, _$SignInRequestImpl>
    implements _$$SignInRequestImplCopyWith<$Res> {
  __$$SignInRequestImplCopyWithImpl(
      _$SignInRequestImpl _value, $Res Function(_$SignInRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$SignInRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$SignInRequestImpl implements _SignInRequest {
  _$SignInRequestImpl(
      {@JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'code') required this.code,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$SignInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRequestImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignInRequest(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      __$$SignInRequestImplCopyWithImpl<_$SignInRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
    required TResult Function(@JsonKey(name: 'refreshToken') String token)
        refresh,
  }) {
    return $default(email, this.code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
    TResult? Function(@JsonKey(name: 'refreshToken') String token)? refresh,
  }) {
    return $default?.call(email, this.code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    TResult Function(@JsonKey(name: 'refreshToken') String token)? refresh,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, this.code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignInRequest value) $default, {
    required TResult Function(_SignInRequestCode value) code,
    required TResult Function(_SignInRefresh value) refresh,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignInRequest value)? $default, {
    TResult? Function(_SignInRequestCode value)? code,
    TResult? Function(_SignInRefresh value)? refresh,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignInRequest value)? $default, {
    TResult Function(_SignInRequestCode value)? code,
    TResult Function(_SignInRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRequestImplToJson(
      this,
    );
  }
}

abstract class _SignInRequest implements SignInRequest {
  factory _SignInRequest(
      {@JsonKey(name: 'email') required final String email,
      @JsonKey(name: 'code') required final String code}) = _$SignInRequestImpl;

  factory _SignInRequest.fromJson(Map<String, dynamic> json) =
      _$SignInRequestImpl.fromJson;

  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'code')
  String get code;
  @JsonKey(ignore: true)
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInRequestCodeImplCopyWith<$Res> {
  factory _$$SignInRequestCodeImplCopyWith(_$SignInRequestCodeImpl value,
          $Res Function(_$SignInRequestCodeImpl) then) =
      __$$SignInRequestCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$SignInRequestCodeImplCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res, _$SignInRequestCodeImpl>
    implements _$$SignInRequestCodeImplCopyWith<$Res> {
  __$$SignInRequestCodeImplCopyWithImpl(_$SignInRequestCodeImpl _value,
      $Res Function(_$SignInRequestCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignInRequestCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInRequestCodeImpl implements _SignInRequestCode {
  _$SignInRequestCodeImpl(
      {@JsonKey(name: 'email') required this.email, final String? $type})
      : $type = $type ?? 'code';

  factory _$SignInRequestCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRequestCodeImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignInRequest.code(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestCodeImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestCodeImplCopyWith<_$SignInRequestCodeImpl> get copyWith =>
      __$$SignInRequestCodeImplCopyWithImpl<_$SignInRequestCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
    required TResult Function(@JsonKey(name: 'refreshToken') String token)
        refresh,
  }) {
    return code(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
    TResult? Function(@JsonKey(name: 'refreshToken') String token)? refresh,
  }) {
    return code?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    TResult Function(@JsonKey(name: 'refreshToken') String token)? refresh,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignInRequest value) $default, {
    required TResult Function(_SignInRequestCode value) code,
    required TResult Function(_SignInRefresh value) refresh,
  }) {
    return code(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignInRequest value)? $default, {
    TResult? Function(_SignInRequestCode value)? code,
    TResult? Function(_SignInRefresh value)? refresh,
  }) {
    return code?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignInRequest value)? $default, {
    TResult Function(_SignInRequestCode value)? code,
    TResult Function(_SignInRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRequestCodeImplToJson(
      this,
    );
  }
}

abstract class _SignInRequestCode implements SignInRequest {
  factory _SignInRequestCode(
          {@JsonKey(name: 'email') required final String email}) =
      _$SignInRequestCodeImpl;

  factory _SignInRequestCode.fromJson(Map<String, dynamic> json) =
      _$SignInRequestCodeImpl.fromJson;

  @JsonKey(name: 'email')
  String get email;
  @JsonKey(ignore: true)
  _$$SignInRequestCodeImplCopyWith<_$SignInRequestCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInRefreshImplCopyWith<$Res> {
  factory _$$SignInRefreshImplCopyWith(
          _$SignInRefreshImpl value, $Res Function(_$SignInRefreshImpl) then) =
      __$$SignInRefreshImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@JsonKey(name: 'refreshToken') String token});
}

/// @nodoc
class __$$SignInRefreshImplCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res, _$SignInRefreshImpl>
    implements _$$SignInRefreshImplCopyWith<$Res> {
  __$$SignInRefreshImplCopyWithImpl(
      _$SignInRefreshImpl _value, $Res Function(_$SignInRefreshImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$SignInRefreshImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInRefreshImpl implements _SignInRefresh {
  _$SignInRefreshImpl(
      {@JsonKey(name: 'refreshToken') required this.token, final String? $type})
      : $type = $type ?? 'refresh';

  factory _$SignInRefreshImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRefreshImplFromJson(json);

  @override
  @JsonKey(name: 'refreshToken')
  final String token;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignInRequest.refresh(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRefreshImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRefreshImplCopyWith<_$SignInRefreshImpl> get copyWith =>
      __$$SignInRefreshImplCopyWithImpl<_$SignInRefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
    required TResult Function(@JsonKey(name: 'refreshToken') String token)
        refresh,
  }) {
    return refresh(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
    TResult? Function(@JsonKey(name: 'refreshToken') String token)? refresh,
  }) {
    return refresh?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'email') String email,
            @JsonKey(name: 'code') String code)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    TResult Function(@JsonKey(name: 'refreshToken') String token)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignInRequest value) $default, {
    required TResult Function(_SignInRequestCode value) code,
    required TResult Function(_SignInRefresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignInRequest value)? $default, {
    TResult? Function(_SignInRequestCode value)? code,
    TResult? Function(_SignInRefresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignInRequest value)? $default, {
    TResult Function(_SignInRequestCode value)? code,
    TResult Function(_SignInRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRefreshImplToJson(
      this,
    );
  }
}

abstract class _SignInRefresh implements SignInRequest {
  factory _SignInRefresh(
          {@JsonKey(name: 'refreshToken') required final String token}) =
      _$SignInRefreshImpl;

  factory _SignInRefresh.fromJson(Map<String, dynamic> json) =
      _$SignInRefreshImpl.fromJson;

  @JsonKey(name: 'refreshToken')
  String get token;
  @JsonKey(ignore: true)
  _$$SignInRefreshImplCopyWith<_$SignInRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _SignUpRequest.fromJson(json);
    case 'code':
      return _SignUpRequestCode.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SignUpRequest',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SignUpRequest {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpRequest value) $default, {
    required TResult Function(_SignUpRequestCode value) code,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpRequest value)? $default, {
    TResult? Function(_SignUpRequestCode value)? code,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpRequest value)? $default, {
    TResult Function(_SignUpRequestCode value)? code,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRequestCopyWith<SignUpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestCopyWith<$Res> {
  factory $SignUpRequestCopyWith(
          SignUpRequest value, $Res Function(SignUpRequest) then) =
      _$SignUpRequestCopyWithImpl<$Res, SignUpRequest>;
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class _$SignUpRequestCopyWithImpl<$Res, $Val extends SignUpRequest>
    implements $SignUpRequestCopyWith<$Res> {
  _$SignUpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRequestImplCopyWith<$Res>
    implements $SignUpRequestCopyWith<$Res> {
  factory _$$SignUpRequestImplCopyWith(
          _$SignUpRequestImpl value, $Res Function(_$SignUpRequestImpl) then) =
      __$$SignUpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'type') UserType userType});
}

/// @nodoc
class __$$SignUpRequestImplCopyWithImpl<$Res>
    extends _$SignUpRequestCopyWithImpl<$Res, _$SignUpRequestImpl>
    implements _$$SignUpRequestImplCopyWith<$Res> {
  __$$SignUpRequestImplCopyWithImpl(
      _$SignUpRequestImpl _value, $Res Function(_$SignUpRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? code = null,
    Object? userType = null,
  }) {
    return _then(_$SignUpRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$SignUpRequestImpl implements _SignUpRequest {
  _$SignUpRequestImpl(
      {@JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'type') required this.userType,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$SignUpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'type')
  final UserType userType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpRequest(email: $email, name: $name, code: $code, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, code, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      __$$SignUpRequestImplCopyWithImpl<_$SignUpRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
  }) {
    return $default(email, name, this.code, userType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
  }) {
    return $default?.call(email, name, this.code, userType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, name, this.code, userType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpRequest value) $default, {
    required TResult Function(_SignUpRequestCode value) code,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpRequest value)? $default, {
    TResult? Function(_SignUpRequestCode value)? code,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpRequest value)? $default, {
    TResult Function(_SignUpRequestCode value)? code,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequest implements SignUpRequest {
  factory _SignUpRequest(
          {@JsonKey(name: 'email') required final String email,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'code') required final String code,
          @JsonKey(name: 'type') required final UserType userType}) =
      _$SignUpRequestImpl;

  factory _SignUpRequest.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'code')
  String get code;
  @JsonKey(name: 'type')
  UserType get userType;
  @override
  @JsonKey(ignore: true)
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpRequestCodeImplCopyWith<$Res>
    implements $SignUpRequestCopyWith<$Res> {
  factory _$$SignUpRequestCodeImplCopyWith(_$SignUpRequestCodeImpl value,
          $Res Function(_$SignUpRequestCodeImpl) then) =
      __$$SignUpRequestCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$SignUpRequestCodeImplCopyWithImpl<$Res>
    extends _$SignUpRequestCopyWithImpl<$Res, _$SignUpRequestCodeImpl>
    implements _$$SignUpRequestCodeImplCopyWith<$Res> {
  __$$SignUpRequestCodeImplCopyWithImpl(_$SignUpRequestCodeImpl _value,
      $Res Function(_$SignUpRequestCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignUpRequestCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRequestCodeImpl implements _SignUpRequestCode {
  _$SignUpRequestCodeImpl(
      {@JsonKey(name: 'email') required this.email, final String? $type})
      : $type = $type ?? 'code';

  factory _$SignUpRequestCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestCodeImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpRequest.code(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestCodeImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestCodeImplCopyWith<_$SignUpRequestCodeImpl> get copyWith =>
      __$$SignUpRequestCodeImplCopyWithImpl<_$SignUpRequestCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)
        $default, {
    required TResult Function(@JsonKey(name: 'email') String email) code,
  }) {
    return code(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult? Function(@JsonKey(name: 'email') String email)? code,
  }) {
    return code?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'code') String code,
            @JsonKey(name: 'type') UserType userType)?
        $default, {
    TResult Function(@JsonKey(name: 'email') String email)? code,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpRequest value) $default, {
    required TResult Function(_SignUpRequestCode value) code,
  }) {
    return code(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpRequest value)? $default, {
    TResult? Function(_SignUpRequestCode value)? code,
  }) {
    return code?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpRequest value)? $default, {
    TResult Function(_SignUpRequestCode value)? code,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestCodeImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequestCode implements SignUpRequest {
  factory _SignUpRequestCode(
          {@JsonKey(name: 'email') required final String email}) =
      _$SignUpRequestCodeImpl;

  factory _SignUpRequestCode.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestCodeImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SignUpRequestCodeImplCopyWith<_$SignUpRequestCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
