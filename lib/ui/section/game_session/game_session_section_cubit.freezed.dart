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
  GameSession get session => throw _privateConstructorUsedError;
  List<Attempt> get attempts => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GameSession session, List<Attempt> attempts, User? user)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GameSession session, List<Attempt> attempts, User? user)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameSession session, List<Attempt> attempts, User? user)?
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
  $Res call({GameSession session, List<Attempt> attempts, User? user});

  $GameSessionCopyWith<$Res> get session;
  $UserCopyWith<$Res>? get user;
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
    Object? session = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession,
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
  $GameSessionCopyWith<$Res> get session {
    return $GameSessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value) as $Val);
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
abstract class _$$GameSessionSectionStateImplCopyWith<$Res>
    implements $GameSessionSectionStateCopyWith<$Res> {
  factory _$$GameSessionSectionStateImplCopyWith(
          _$GameSessionSectionStateImpl value,
          $Res Function(_$GameSessionSectionStateImpl) then) =
      __$$GameSessionSectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameSession session, List<Attempt> attempts, User? user});

  @override
  $GameSessionCopyWith<$Res> get session;
  @override
  $UserCopyWith<$Res>? get user;
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
    Object? session = null,
    Object? attempts = null,
    Object? user = freezed,
  }) {
    return _then(_$GameSessionSectionStateImpl(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession,
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

class _$GameSessionSectionStateImpl implements _GameSessionSectionState {
  const _$GameSessionSectionStateImpl(
      {required this.session,
      final List<Attempt> attempts = const [],
      this.user = null})
      : _attempts = attempts;

  @override
  final GameSession session;
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
    return 'GameSessionSectionState.state(session: $session, attempts: $attempts, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionSectionStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session,
      const DeepCollectionEquality().hash(_attempts), user);

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
            GameSession session, List<Attempt> attempts, User? user)
        state,
  }) {
    return state(session, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GameSession session, List<Attempt> attempts, User? user)?
        state,
  }) {
    return state?.call(session, attempts, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GameSession session, List<Attempt> attempts, User? user)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(session, attempts, user);
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
      {required final GameSession session,
      final List<Attempt> attempts,
      final User? user}) = _$GameSessionSectionStateImpl;

  @override
  GameSession get session;
  @override
  List<Attempt> get attempts;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionSectionStateImplCopyWith<_$GameSessionSectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
