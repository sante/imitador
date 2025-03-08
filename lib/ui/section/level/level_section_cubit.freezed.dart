// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LevelSectionState {
  Level get level => throw _privateConstructorUsedError;
  List<Attempt> get attempts => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Level level, List<Attempt> attempts, User? user)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Level level, List<Attempt> attempts, User? user)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Level level, List<Attempt> attempts, User? user)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LevelSectionState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LevelSectionState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LevelSectionState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LevelSectionStateCopyWith<LevelSectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelSectionStateCopyWith<$Res> {
  factory $LevelSectionStateCopyWith(
          LevelSectionState value, $Res Function(LevelSectionState) then) =
      _$LevelSectionStateCopyWithImpl<$Res, LevelSectionState>;
  @useResult
  $Res call({Level level, List<Attempt> attempts, User? user});

  $LevelCopyWith<$Res> get level;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LevelSectionStateCopyWithImpl<$Res, $Val extends LevelSectionState>
    implements $LevelSectionStateCopyWith<$Res> {
  _$LevelSectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<Attempt>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LevelCopyWith<$Res> get level {
    return $LevelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LevelSectionStateImplCopyWith<$Res>
    implements $LevelSectionStateCopyWith<$Res> {
  factory _$$LevelSectionStateImplCopyWith(_$LevelSectionStateImpl value,
          $Res Function(_$LevelSectionStateImpl) then) =
      __$$LevelSectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Level level, List<Attempt> attempts, User? user});

  @override
  $LevelCopyWith<$Res> get level;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LevelSectionStateImplCopyWithImpl<$Res>
    extends _$LevelSectionStateCopyWithImpl<$Res, _$LevelSectionStateImpl>
    implements _$$LevelSectionStateImplCopyWith<$Res> {
  __$$LevelSectionStateImplCopyWithImpl(_$LevelSectionStateImpl _value,
      $Res Function(_$LevelSectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_$LevelSectionStateImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      attempts: null == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<Attempt>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$LevelSectionStateImpl implements _LevelSectionState {
  const _$LevelSectionStateImpl(
      {required this.level,
      final List<Attempt> attempts = const [],
      this.user = null})
      : _attempts = attempts;

  @override
  final Level level;
  final List<Attempt> _attempts;
  @override
  @JsonKey()
  List<Attempt> get attempts {
    if (_attempts is EqualUnmodifiableListView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attempts);
  }

  @override
  @JsonKey()
  final User? user;

  @override
  String toString() {
    return 'LevelSectionState.state(level: $level, attempts: $attempts, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelSectionStateImpl &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, level, const DeepCollectionEquality().hash(_attempts), user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelSectionStateImplCopyWith<_$LevelSectionStateImpl> get copyWith =>
      __$$LevelSectionStateImplCopyWithImpl<_$LevelSectionStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Level level, List<Attempt> attempts, User? user)
        state,
  }) {
    return state(level, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Level level, List<Attempt> attempts, User? user)? state,
  }) {
    return state?.call(level, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Level level, List<Attempt> attempts, User? user)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(level, attempts, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LevelSectionState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LevelSectionState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LevelSectionState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _LevelSectionState implements LevelSectionState {
  const factory _LevelSectionState(
      {required final Level level,
      final List<Attempt> attempts,
      final User? user}) = _$LevelSectionStateImpl;

  @override
  Level get level;
  @override
  List<Attempt> get attempts;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$LevelSectionStateImplCopyWith<_$LevelSectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
