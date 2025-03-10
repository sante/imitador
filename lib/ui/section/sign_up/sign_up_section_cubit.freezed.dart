// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpSectionState {
  List<Level>? get levels => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Level>? levels) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Level>? levels)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Level>? levels)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpSectionStateState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpSectionStateState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpSectionStateState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpSectionStateCopyWith<SignUpSectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpSectionStateCopyWith<$Res> {
  factory $SignUpSectionStateCopyWith(
          SignUpSectionState value, $Res Function(SignUpSectionState) then) =
      _$SignUpSectionStateCopyWithImpl<$Res, SignUpSectionState>;
  @useResult
  $Res call({List<Level>? levels});
}

/// @nodoc
class _$SignUpSectionStateCopyWithImpl<$Res, $Val extends SignUpSectionState>
    implements $SignUpSectionStateCopyWith<$Res> {
  _$SignUpSectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = freezed,
  }) {
    return _then(_value.copyWith(
      levels: freezed == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpSectionStateStateImplCopyWith<$Res>
    implements $SignUpSectionStateCopyWith<$Res> {
  factory _$$SignUpSectionStateStateImplCopyWith(
          _$SignUpSectionStateStateImpl value,
          $Res Function(_$SignUpSectionStateStateImpl) then) =
      __$$SignUpSectionStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Level>? levels});
}

/// @nodoc
class __$$SignUpSectionStateStateImplCopyWithImpl<$Res>
    extends _$SignUpSectionStateCopyWithImpl<$Res,
        _$SignUpSectionStateStateImpl>
    implements _$$SignUpSectionStateStateImplCopyWith<$Res> {
  __$$SignUpSectionStateStateImplCopyWithImpl(
      _$SignUpSectionStateStateImpl _value,
      $Res Function(_$SignUpSectionStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = freezed,
  }) {
    return _then(_$SignUpSectionStateStateImpl(
      levels: freezed == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>?,
    ));
  }
}

/// @nodoc

class _$SignUpSectionStateStateImpl implements _SignUpSectionStateState {
  const _$SignUpSectionStateStateImpl({final List<Level>? levels = null})
      : _levels = levels;

  final List<Level>? _levels;
  @override
  @JsonKey()
  List<Level>? get levels {
    final value = _levels;
    if (value == null) return null;
    if (_levels is EqualUnmodifiableListView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SignUpSectionState.state(levels: $levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpSectionStateStateImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpSectionStateStateImplCopyWith<_$SignUpSectionStateStateImpl>
      get copyWith => __$$SignUpSectionStateStateImplCopyWithImpl<
          _$SignUpSectionStateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Level>? levels) state,
  }) {
    return state(levels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Level>? levels)? state,
  }) {
    return state?.call(levels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Level>? levels)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(levels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpSectionStateState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpSectionStateState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpSectionStateState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _SignUpSectionStateState implements SignUpSectionState {
  const factory _SignUpSectionStateState({final List<Level>? levels}) =
      _$SignUpSectionStateStateImpl;

  @override
  List<Level>? get levels;
  @override
  @JsonKey(ignore: true)
  _$$SignUpSectionStateStateImplCopyWith<_$SignUpSectionStateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
