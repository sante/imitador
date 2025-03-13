// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JoinSessionState {
  String get code => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, bool isLoading, String? error) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code, bool isLoading, String? error)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, bool isLoading, String? error)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinSessionState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinSessionState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinSessionState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JoinSessionStateCopyWith<JoinSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinSessionStateCopyWith<$Res> {
  factory $JoinSessionStateCopyWith(
          JoinSessionState value, $Res Function(JoinSessionState) then) =
      _$JoinSessionStateCopyWithImpl<$Res, JoinSessionState>;
  @useResult
  $Res call({String code, bool isLoading, String? error});
}

/// @nodoc
class _$JoinSessionStateCopyWithImpl<$Res, $Val extends JoinSessionState>
    implements $JoinSessionStateCopyWith<$Res> {
  _$JoinSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinSessionStateImplCopyWith<$Res>
    implements $JoinSessionStateCopyWith<$Res> {
  factory _$$JoinSessionStateImplCopyWith(_$JoinSessionStateImpl value,
          $Res Function(_$JoinSessionStateImpl) then) =
      __$$JoinSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, bool isLoading, String? error});
}

/// @nodoc
class __$$JoinSessionStateImplCopyWithImpl<$Res>
    extends _$JoinSessionStateCopyWithImpl<$Res, _$JoinSessionStateImpl>
    implements _$$JoinSessionStateImplCopyWith<$Res> {
  __$$JoinSessionStateImplCopyWithImpl(_$JoinSessionStateImpl _value,
      $Res Function(_$JoinSessionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$JoinSessionStateImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$JoinSessionStateImpl implements _JoinSessionState {
  const _$JoinSessionStateImpl(
      {this.code = '', this.isLoading = false, this.error});

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'JoinSessionState.state(code: $code, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinSessionStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinSessionStateImplCopyWith<_$JoinSessionStateImpl> get copyWith =>
      __$$JoinSessionStateImplCopyWithImpl<_$JoinSessionStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, bool isLoading, String? error) state,
  }) {
    return state(code, isLoading, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code, bool isLoading, String? error)? state,
  }) {
    return state?.call(code, isLoading, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, bool isLoading, String? error)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(code, isLoading, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinSessionState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinSessionState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinSessionState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _JoinSessionState implements JoinSessionState {
  const factory _JoinSessionState(
      {final String code,
      final bool isLoading,
      final String? error}) = _$JoinSessionStateImpl;

  @override
  String get code;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$JoinSessionStateImplCopyWith<_$JoinSessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
