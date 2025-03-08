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
  Activity get activity => throw _privateConstructorUsedError;
  List<Attempt> get attempts => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Activity activity, List<Attempt> attempts, User? user)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity activity, List<Attempt> attempts, User? user)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity activity, List<Attempt> attempts, User? user)?
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
  $Res call({Activity activity, List<Attempt> attempts, User? user});

  $ActivityCopyWith<$Res> get activity;
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
    Object? activity = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
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
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
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
  $Res call({Activity activity, List<Attempt> attempts, User? user});

  @override
  $ActivityCopyWith<$Res> get activity;
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
    Object? activity = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_$ActivitySectionStateImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
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

class _$ActivitySectionStateImpl implements _ActivitySectionState {
  const _$ActivitySectionStateImpl(
      {required this.activity,
      final List<Attempt> attempts = const [],
      this.user = null})
      : _attempts = attempts;

  @override
  final Activity activity;
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
    return 'ActivitySectionState.state(activity: $activity, attempts: $attempts, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySectionStateImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity,
      const DeepCollectionEquality().hash(_attempts), user);

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
    required TResult Function(
            Activity activity, List<Attempt> attempts, User? user)
        state,
  }) {
    return state(activity, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity activity, List<Attempt> attempts, User? user)?
        state,
  }) {
    return state?.call(activity, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity activity, List<Attempt> attempts, User? user)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(activity, attempts, user);
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
      {required final Activity activity,
      final List<Attempt> attempts,
      final User? user}) = _$ActivitySectionStateImpl;

  @override
  Activity get activity;
  @override
  List<Attempt> get attempts;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$ActivitySectionStateImplCopyWith<_$ActivitySectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
