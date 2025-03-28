// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameSessionSectionState {
  String? get code => throw _privateConstructorUsedError;
  GameSession? get session => throw _privateConstructorUsedError;
  List<Attempt> get attempts => throw _privateConstructorUsedError;
  Level? get currentLevel => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get gameId => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  Activity? get activity => throw _privateConstructorUsedError;
  String? get creatorId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameSessionSectionState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameSessionSectionState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameSessionSectionState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameSessionSectionStateCopyWith<GameSessionSectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionSectionStateCopyWith<$Res> {
  factory $GameSessionSectionStateCopyWith(GameSessionSectionState value,
          $Res Function(GameSessionSectionState) then) =
      _$GameSessionSectionStateCopyWithImpl<$Res, GameSessionSectionState>;
  @useResult
  $Res call(
      {String? code,
      GameSession? session,
      List<Attempt> attempts,
      Level? currentLevel,
      User? user,
      String? gameId,
      bool isConnected,
      Activity? activity,
      String? creatorId});

  $GameSessionCopyWith<$Res>? get session;
  $LevelCopyWith<$Res>? get currentLevel;
  $UserCopyWith<$Res>? get user;
  $ActivityCopyWith<$Res>? get activity;
}

/// @nodoc
class _$GameSessionSectionStateCopyWithImpl<$Res,
        $Val extends GameSessionSectionState>
    implements $GameSessionSectionStateCopyWith<$Res> {
  _$GameSessionSectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? session = freezed,
    Object? attempts = null,
    Object? currentLevel = freezed,
    Object? user = freezed,
    Object? gameId = freezed,
    Object? isConnected = null,
    Object? activity = freezed,
    Object? creatorId = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession?,
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
      gameId: freezed == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameSessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $GameSessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
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
}

/// @nodoc
abstract class _$$GameSessionSectionStateImplCopyWith<$Res>
    implements $GameSessionSectionStateCopyWith<$Res> {
  factory _$$GameSessionSectionStateImplCopyWith(
          _$GameSessionSectionStateImpl value,
          $Res Function(_$GameSessionSectionStateImpl) then) =
      __$$GameSessionSectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      GameSession? session,
      List<Attempt> attempts,
      Level? currentLevel,
      User? user,
      String? gameId,
      bool isConnected,
      Activity? activity,
      String? creatorId});

  @override
  $GameSessionCopyWith<$Res>? get session;
  @override
  $LevelCopyWith<$Res>? get currentLevel;
  @override
  $UserCopyWith<$Res>? get user;
  @override
  $ActivityCopyWith<$Res>? get activity;
}

/// @nodoc
class __$$GameSessionSectionStateImplCopyWithImpl<$Res>
    extends _$GameSessionSectionStateCopyWithImpl<$Res,
        _$GameSessionSectionStateImpl>
    implements _$$GameSessionSectionStateImplCopyWith<$Res> {
  __$$GameSessionSectionStateImplCopyWithImpl(
      _$GameSessionSectionStateImpl _value,
      $Res Function(_$GameSessionSectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? session = freezed,
    Object? attempts = null,
    Object? currentLevel = freezed,
    Object? user = freezed,
    Object? gameId = freezed,
    Object? isConnected = null,
    Object? activity = freezed,
    Object? creatorId = freezed,
  }) {
    return _then(_$GameSessionSectionStateImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession?,
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
      gameId: freezed == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GameSessionSectionStateImpl implements _GameSessionSectionState {
  const _$GameSessionSectionStateImpl(
      {this.code = null,
      this.session = null,
      final List<Attempt> attempts = const [],
      this.currentLevel = null,
      this.user = null,
      this.gameId = null,
      this.isConnected = false,
      this.activity = null,
      this.creatorId = null})
      : _attempts = attempts;

  @override
  @JsonKey()
  final String? code;
  @override
  @JsonKey()
  final GameSession? session;
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
  final String? gameId;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final Activity? activity;
  @override
  @JsonKey()
  final String? creatorId;

  @override
  String toString() {
    return 'GameSessionSectionState.state(code: $code, session: $session, attempts: $attempts, currentLevel: $currentLevel, user: $user, gameId: $gameId, isConnected: $isConnected, activity: $activity, creatorId: $creatorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionSectionStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      session,
      const DeepCollectionEquality().hash(_attempts),
      currentLevel,
      user,
      gameId,
      isConnected,
      activity,
      creatorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionSectionStateImplCopyWith<_$GameSessionSectionStateImpl>
      get copyWith => __$$GameSessionSectionStateImplCopyWithImpl<
          _$GameSessionSectionStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)
        state,
  }) {
    return state(code, session, attempts, currentLevel, user, gameId,
        isConnected, activity, creatorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)?
        state,
  }) {
    return state?.call(code, session, attempts, currentLevel, user, gameId,
        isConnected, activity, creatorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? code,
            GameSession? session,
            List<Attempt> attempts,
            Level? currentLevel,
            User? user,
            String? gameId,
            bool isConnected,
            Activity? activity,
            String? creatorId)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(code, session, attempts, currentLevel, user, gameId,
          isConnected, activity, creatorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameSessionSectionState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameSessionSectionState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameSessionSectionState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _GameSessionSectionState implements GameSessionSectionState {
  const factory _GameSessionSectionState(
      {final String? code,
      final GameSession? session,
      final List<Attempt> attempts,
      final Level? currentLevel,
      final User? user,
      final String? gameId,
      final bool isConnected,
      final Activity? activity,
      final String? creatorId}) = _$GameSessionSectionStateImpl;

  @override
  String? get code;
  @override
  GameSession? get session;
  @override
  List<Attempt> get attempts;
  @override
  Level? get currentLevel;
  @override
  User? get user;
  @override
  String? get gameId;
  @override
  bool get isConnected;
  @override
  Activity? get activity;
  @override
  String? get creatorId;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionSectionStateImplCopyWith<_$GameSessionSectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
