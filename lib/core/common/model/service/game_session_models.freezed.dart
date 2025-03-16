// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameSessionJoinRequest _$GameSessionJoinRequestFromJson(
    Map<String, dynamic> json) {
  return _GameSessionJoinRequest.fromJson(json);
}

/// @nodoc
mixin _$GameSessionJoinRequest {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSessionJoinRequestCopyWith<GameSessionJoinRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionJoinRequestCopyWith<$Res> {
  factory $GameSessionJoinRequestCopyWith(GameSessionJoinRequest value,
          $Res Function(GameSessionJoinRequest) then) =
      _$GameSessionJoinRequestCopyWithImpl<$Res, GameSessionJoinRequest>;
  @useResult
  $Res call({@JsonKey(name: 'code') String code});
}

/// @nodoc
class _$GameSessionJoinRequestCopyWithImpl<$Res,
        $Val extends GameSessionJoinRequest>
    implements $GameSessionJoinRequestCopyWith<$Res> {
  _$GameSessionJoinRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSessionJoinRequestImplCopyWith<$Res>
    implements $GameSessionJoinRequestCopyWith<$Res> {
  factory _$$GameSessionJoinRequestImplCopyWith(
          _$GameSessionJoinRequestImpl value,
          $Res Function(_$GameSessionJoinRequestImpl) then) =
      __$$GameSessionJoinRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'code') String code});
}

/// @nodoc
class __$$GameSessionJoinRequestImplCopyWithImpl<$Res>
    extends _$GameSessionJoinRequestCopyWithImpl<$Res,
        _$GameSessionJoinRequestImpl>
    implements _$$GameSessionJoinRequestImplCopyWith<$Res> {
  __$$GameSessionJoinRequestImplCopyWithImpl(
      _$GameSessionJoinRequestImpl _value,
      $Res Function(_$GameSessionJoinRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$GameSessionJoinRequestImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$GameSessionJoinRequestImpl implements _GameSessionJoinRequest {
  _$GameSessionJoinRequestImpl({@JsonKey(name: 'code') required this.code});

  factory _$GameSessionJoinRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSessionJoinRequestImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;

  @override
  String toString() {
    return 'GameSessionJoinRequest(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionJoinRequestImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionJoinRequestImplCopyWith<_$GameSessionJoinRequestImpl>
      get copyWith => __$$GameSessionJoinRequestImplCopyWithImpl<
          _$GameSessionJoinRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSessionJoinRequestImplToJson(
      this,
    );
  }
}

abstract class _GameSessionJoinRequest implements GameSessionJoinRequest {
  factory _GameSessionJoinRequest(
          {@JsonKey(name: 'code') required final String code}) =
      _$GameSessionJoinRequestImpl;

  factory _GameSessionJoinRequest.fromJson(Map<String, dynamic> json) =
      _$GameSessionJoinRequestImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionJoinRequestImplCopyWith<_$GameSessionJoinRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GameSessionJoinResponse _$GameSessionJoinResponseFromJson(
    Map<String, dynamic> json) {
  return _GameSessionJoinResponse.fromJson(json);
}

/// @nodoc
mixin _$GameSessionJoinResponse {
  String get id => throw _privateConstructorUsedError;
  String get activityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSessionJoinResponseCopyWith<GameSessionJoinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionJoinResponseCopyWith<$Res> {
  factory $GameSessionJoinResponseCopyWith(GameSessionJoinResponse value,
          $Res Function(GameSessionJoinResponse) then) =
      _$GameSessionJoinResponseCopyWithImpl<$Res, GameSessionJoinResponse>;
  @useResult
  $Res call({String id, String activityId});
}

/// @nodoc
class _$GameSessionJoinResponseCopyWithImpl<$Res,
        $Val extends GameSessionJoinResponse>
    implements $GameSessionJoinResponseCopyWith<$Res> {
  _$GameSessionJoinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activityId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSessionJoinResponseImplCopyWith<$Res>
    implements $GameSessionJoinResponseCopyWith<$Res> {
  factory _$$GameSessionJoinResponseImplCopyWith(
          _$GameSessionJoinResponseImpl value,
          $Res Function(_$GameSessionJoinResponseImpl) then) =
      __$$GameSessionJoinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String activityId});
}

/// @nodoc
class __$$GameSessionJoinResponseImplCopyWithImpl<$Res>
    extends _$GameSessionJoinResponseCopyWithImpl<$Res,
        _$GameSessionJoinResponseImpl>
    implements _$$GameSessionJoinResponseImplCopyWith<$Res> {
  __$$GameSessionJoinResponseImplCopyWithImpl(
      _$GameSessionJoinResponseImpl _value,
      $Res Function(_$GameSessionJoinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activityId = null,
  }) {
    return _then(_$GameSessionJoinResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$GameSessionJoinResponseImpl implements _GameSessionJoinResponse {
  _$GameSessionJoinResponseImpl({required this.id, required this.activityId});

  factory _$GameSessionJoinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSessionJoinResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String activityId;

  @override
  String toString() {
    return 'GameSessionJoinResponse(id: $id, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionJoinResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, activityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionJoinResponseImplCopyWith<_$GameSessionJoinResponseImpl>
      get copyWith => __$$GameSessionJoinResponseImplCopyWithImpl<
          _$GameSessionJoinResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSessionJoinResponseImplToJson(
      this,
    );
  }
}

abstract class _GameSessionJoinResponse implements GameSessionJoinResponse {
  factory _GameSessionJoinResponse(
      {required final String id,
      required final String activityId}) = _$GameSessionJoinResponseImpl;

  factory _GameSessionJoinResponse.fromJson(Map<String, dynamic> json) =
      _$GameSessionJoinResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get activityId;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionJoinResponseImplCopyWith<_$GameSessionJoinResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
