// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivitySectionState {
  Activity? get activity => throw _privateConstructorUsedError;
  List<Attempt> get attempts => throw _privateConstructorUsedError;
  Level? get currentLevel => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActivitySectionState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActivitySectionState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActivitySectionState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivitySectionStateCopyWith<ActivitySectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitySectionStateCopyWith<$Res> {
  factory $ActivitySectionStateCopyWith(ActivitySectionState value,
          $Res Function(ActivitySectionState) then) =
      _$ActivitySectionStateCopyWithImpl<$Res, ActivitySectionState>;
  @useResult
  $Res call(
      {Activity? activity,
      List<Attempt> attempts,
      Level? currentLevel,
      User? user,
      bool isLoading});

  $ActivityCopyWith<$Res>? get activity;
  $LevelCopyWith<$Res>? get currentLevel;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivitySectionStateCopyWithImpl<$Res,
        $Val extends ActivitySectionState>
    implements $ActivitySectionStateCopyWith<$Res> {
  _$ActivitySectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = freezed,
    Object? attempts = null,
    Object? currentLevel = freezed,
    Object? user = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<Attempt>,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as Level?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res>? get activity {
    if (_value.activity == null) {
      return null;
    }

    return $ActivityCopyWith<$Res>(_value.activity!, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LevelCopyWith<$Res>? get currentLevel {
    if (_value.currentLevel == null) {
      return null;
    }

    return $LevelCopyWith<$Res>(_value.currentLevel!, (value) {
      return _then(_value.copyWith(currentLevel: value) as $Val);
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
abstract class _$$ActivitySectionStateImplCopyWith<$Res>
    implements $ActivitySectionStateCopyWith<$Res> {
  factory _$$ActivitySectionStateImplCopyWith(_$ActivitySectionStateImpl value,
          $Res Function(_$ActivitySectionStateImpl) then) =
      __$$ActivitySectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Activity? activity,
      List<Attempt> attempts,
      Level? currentLevel,
      User? user,
      bool isLoading});

  @override
  $ActivityCopyWith<$Res>? get activity;
  @override
  $LevelCopyWith<$Res>? get currentLevel;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ActivitySectionStateImplCopyWithImpl<$Res>
    extends _$ActivitySectionStateCopyWithImpl<$Res, _$ActivitySectionStateImpl>
    implements _$$ActivitySectionStateImplCopyWith<$Res> {
  __$$ActivitySectionStateImplCopyWithImpl(_$ActivitySectionStateImpl _value,
      $Res Function(_$ActivitySectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = freezed,
    Object? attempts = null,
    Object? currentLevel = freezed,
    Object? user = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$ActivitySectionStateImpl(
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      attempts: null == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<Attempt>,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as Level?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ActivitySectionStateImpl implements _ActivitySectionState {
  const _$ActivitySectionStateImpl(
      {this.activity = null,
      final List<Attempt> attempts = const [],
      this.currentLevel = null,
      this.user = null,
      this.isLoading = true})
      : _attempts = attempts;

  @override
  @JsonKey()
  final Activity? activity;
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
  final Level? currentLevel;
  @override
  @JsonKey()
  final User? user;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ActivitySectionState.state(activity: $activity, attempts: $attempts, currentLevel: $currentLevel, user: $user, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySectionStateImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activity,
      const DeepCollectionEquality().hash(_attempts),
      currentLevel,
      user,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitySectionStateImplCopyWith<_$ActivitySectionStateImpl>
      get copyWith =>
          __$$ActivitySectionStateImplCopyWithImpl<_$ActivitySectionStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)
        state,
  }) {
    return state(activity, attempts, currentLevel, user, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)?
        state,
  }) {
    return state?.call(activity, attempts, currentLevel, user, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, List<Attempt> attempts,
            Level? currentLevel, User? user, bool isLoading)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(activity, attempts, currentLevel, user, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ActivitySectionState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ActivitySectionState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ActivitySectionState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _ActivitySectionState implements ActivitySectionState {
  const factory _ActivitySectionState(
      {final Activity? activity,
      final List<Attempt> attempts,
      final Level? currentLevel,
      final User? user,
      final bool isLoading}) = _$ActivitySectionStateImpl;

  @override
  Activity? get activity;
  @override
  List<Attempt> get attempts;
  @override
  Level? get currentLevel;
  @override
  User? get user;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ActivitySectionStateImplCopyWith<_$ActivitySectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
