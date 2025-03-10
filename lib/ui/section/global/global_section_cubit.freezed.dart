// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalSectionState {
  User? get user => throw _privateConstructorUsedError;
  List<Level>? get levels => throw _privateConstructorUsedError;
  List<Activity>? get activities => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User? user, List<Level>? levels, List<Activity>? activities)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User? user, List<Level>? levels, List<Activity>? activities)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User? user, List<Level>? levels, List<Activity>? activities)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GlobalSectionStateState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GlobalSectionStateState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GlobalSectionStateState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalSectionStateCopyWith<GlobalSectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSectionStateCopyWith<$Res> {
  factory $GlobalSectionStateCopyWith(
          GlobalSectionState value, $Res Function(GlobalSectionState) then) =
      _$GlobalSectionStateCopyWithImpl<$Res, GlobalSectionState>;
  @useResult
  $Res call({User? user, List<Level>? levels, List<Activity>? activities});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GlobalSectionStateCopyWithImpl<$Res, $Val extends GlobalSectionState>
    implements $GlobalSectionStateCopyWith<$Res> {
  _$GlobalSectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? levels = freezed,
    Object? activities = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      levels: freezed == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
    ) as $Val);
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
abstract class _$$GlobalSectionStateStateImplCopyWith<$Res>
    implements $GlobalSectionStateCopyWith<$Res> {
  factory _$$GlobalSectionStateStateImplCopyWith(
          _$GlobalSectionStateStateImpl value,
          $Res Function(_$GlobalSectionStateStateImpl) then) =
      __$$GlobalSectionStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, List<Level>? levels, List<Activity>? activities});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GlobalSectionStateStateImplCopyWithImpl<$Res>
    extends _$GlobalSectionStateCopyWithImpl<$Res,
        _$GlobalSectionStateStateImpl>
    implements _$$GlobalSectionStateStateImplCopyWith<$Res> {
  __$$GlobalSectionStateStateImplCopyWithImpl(
      _$GlobalSectionStateStateImpl _value,
      $Res Function(_$GlobalSectionStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? levels = freezed,
    Object? activities = freezed,
  }) {
    return _then(_$GlobalSectionStateStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      levels: freezed == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>?,
      activities: freezed == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
    ));
  }
}

/// @nodoc

class _$GlobalSectionStateStateImpl implements _GlobalSectionStateState {
  const _$GlobalSectionStateStateImpl(
      {this.user = null,
      final List<Level>? levels = null,
      final List<Activity>? activities = null})
      : _levels = levels,
        _activities = activities;

  @override
  @JsonKey()
  final User? user;
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

  final List<Activity>? _activities;
  @override
  @JsonKey()
  List<Activity>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GlobalSectionState.state(user: $user, levels: $levels, activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSectionStateStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._levels, _levels) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_levels),
      const DeepCollectionEquality().hash(_activities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSectionStateStateImplCopyWith<_$GlobalSectionStateStateImpl>
      get copyWith => __$$GlobalSectionStateStateImplCopyWithImpl<
          _$GlobalSectionStateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User? user, List<Level>? levels, List<Activity>? activities)
        state,
  }) {
    return state(user, levels, activities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User? user, List<Level>? levels, List<Activity>? activities)?
        state,
  }) {
    return state?.call(user, levels, activities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User? user, List<Level>? levels, List<Activity>? activities)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(user, levels, activities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GlobalSectionStateState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GlobalSectionStateState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GlobalSectionStateState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _GlobalSectionStateState implements GlobalSectionState {
  const factory _GlobalSectionStateState(
      {final User? user,
      final List<Level>? levels,
      final List<Activity>? activities}) = _$GlobalSectionStateStateImpl;

  @override
  User? get user;
  @override
  List<Level>? get levels;
  @override
  List<Activity>? get activities;
  @override
  @JsonKey(ignore: true)
  _$$GlobalSectionStateStateImplCopyWith<_$GlobalSectionStateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
