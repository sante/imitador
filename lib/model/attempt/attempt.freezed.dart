// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attempt _$AttemptFromJson(Map<String, dynamic> json) {
  return _Attempt.fromJson(json);
}

/// @nodoc
mixin _$Attempt {
  String? get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get stars => throw _privateConstructorUsedError;
  List<double> get plotPointsX => throw _privateConstructorUsedError;
  List<double> get plotPointsY => throw _privateConstructorUsedError;
  InterfaceType get interfaceType => throw _privateConstructorUsedError;
  List<String> get expressions => throw _privateConstructorUsedError;
  String get levelId => throw _privateConstructorUsedError;
  Level get level => throw _privateConstructorUsedError;
  String? get playerId => throw _privateConstructorUsedError;
  String? get gameSessionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttemptCopyWith<Attempt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttemptCopyWith<$Res> {
  factory $AttemptCopyWith(Attempt value, $Res Function(Attempt) then) =
      _$AttemptCopyWithImpl<$Res, Attempt>;
  @useResult
  $Res call(
      {String? id,
      int score,
      int stars,
      List<double> plotPointsX,
      List<double> plotPointsY,
      InterfaceType interfaceType,
      List<String> expressions,
      String levelId,
      Level level,
      String? playerId,
      String? gameSessionId});

  $LevelCopyWith<$Res> get level;
}

/// @nodoc
class _$AttemptCopyWithImpl<$Res, $Val extends Attempt>
    implements $AttemptCopyWith<$Res> {
  _$AttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? score = null,
    Object? stars = null,
    Object? plotPointsX = null,
    Object? plotPointsY = null,
    Object? interfaceType = null,
    Object? expressions = null,
    Object? levelId = null,
    Object? level = null,
    Object? playerId = freezed,
    Object? gameSessionId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      plotPointsX: null == plotPointsX
          ? _value.plotPointsX
          : plotPointsX // ignore: cast_nullable_to_non_nullable
              as List<double>,
      plotPointsY: null == plotPointsY
          ? _value.plotPointsY
          : plotPointsY // ignore: cast_nullable_to_non_nullable
              as List<double>,
      interfaceType: null == interfaceType
          ? _value.interfaceType
          : interfaceType // ignore: cast_nullable_to_non_nullable
              as InterfaceType,
      expressions: null == expressions
          ? _value.expressions
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      levelId: null == levelId
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      gameSessionId: freezed == gameSessionId
          ? _value.gameSessionId
          : gameSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LevelCopyWith<$Res> get level {
    return $LevelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttemptImplCopyWith<$Res> implements $AttemptCopyWith<$Res> {
  factory _$$AttemptImplCopyWith(
          _$AttemptImpl value, $Res Function(_$AttemptImpl) then) =
      __$$AttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int score,
      int stars,
      List<double> plotPointsX,
      List<double> plotPointsY,
      InterfaceType interfaceType,
      List<String> expressions,
      String levelId,
      Level level,
      String? playerId,
      String? gameSessionId});

  @override
  $LevelCopyWith<$Res> get level;
}

/// @nodoc
class __$$AttemptImplCopyWithImpl<$Res>
    extends _$AttemptCopyWithImpl<$Res, _$AttemptImpl>
    implements _$$AttemptImplCopyWith<$Res> {
  __$$AttemptImplCopyWithImpl(
      _$AttemptImpl _value, $Res Function(_$AttemptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? score = null,
    Object? stars = null,
    Object? plotPointsX = null,
    Object? plotPointsY = null,
    Object? interfaceType = null,
    Object? expressions = null,
    Object? levelId = null,
    Object? level = null,
    Object? playerId = freezed,
    Object? gameSessionId = freezed,
  }) {
    return _then(_$AttemptImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      plotPointsX: null == plotPointsX
          ? _value._plotPointsX
          : plotPointsX // ignore: cast_nullable_to_non_nullable
              as List<double>,
      plotPointsY: null == plotPointsY
          ? _value._plotPointsY
          : plotPointsY // ignore: cast_nullable_to_non_nullable
              as List<double>,
      interfaceType: null == interfaceType
          ? _value.interfaceType
          : interfaceType // ignore: cast_nullable_to_non_nullable
              as InterfaceType,
      expressions: null == expressions
          ? _value._expressions
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      levelId: null == levelId
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      gameSessionId: freezed == gameSessionId
          ? _value.gameSessionId
          : gameSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttemptImpl implements _Attempt {
  const _$AttemptImpl(
      {this.id,
      required this.score,
      required this.stars,
      required final List<double> plotPointsX,
      required final List<double> plotPointsY,
      required this.interfaceType,
      required final List<String> expressions,
      required this.levelId,
      required this.level,
      required this.playerId,
      this.gameSessionId})
      : _plotPointsX = plotPointsX,
        _plotPointsY = plotPointsY,
        _expressions = expressions;

  factory _$AttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttemptImplFromJson(json);

  @override
  final String? id;
  @override
  final int score;
  @override
  final int stars;
  final List<double> _plotPointsX;
  @override
  List<double> get plotPointsX {
    if (_plotPointsX is EqualUnmodifiableListView) return _plotPointsX;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plotPointsX);
  }

  final List<double> _plotPointsY;
  @override
  List<double> get plotPointsY {
    if (_plotPointsY is EqualUnmodifiableListView) return _plotPointsY;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plotPointsY);
  }

  @override
  final InterfaceType interfaceType;
  final List<String> _expressions;
  @override
  List<String> get expressions {
    if (_expressions is EqualUnmodifiableListView) return _expressions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expressions);
  }

  @override
  final String levelId;
  @override
  final Level level;
  @override
  final String? playerId;
  @override
  final String? gameSessionId;

  @override
  String toString() {
    return 'Attempt(id: $id, score: $score, stars: $stars, plotPointsX: $plotPointsX, plotPointsY: $plotPointsY, interfaceType: $interfaceType, expressions: $expressions, levelId: $levelId, level: $level, playerId: $playerId, gameSessionId: $gameSessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            const DeepCollectionEquality()
                .equals(other._plotPointsX, _plotPointsX) &&
            const DeepCollectionEquality()
                .equals(other._plotPointsY, _plotPointsY) &&
            (identical(other.interfaceType, interfaceType) ||
                other.interfaceType == interfaceType) &&
            const DeepCollectionEquality()
                .equals(other._expressions, _expressions) &&
            (identical(other.levelId, levelId) || other.levelId == levelId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.gameSessionId, gameSessionId) ||
                other.gameSessionId == gameSessionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      score,
      stars,
      const DeepCollectionEquality().hash(_plotPointsX),
      const DeepCollectionEquality().hash(_plotPointsY),
      interfaceType,
      const DeepCollectionEquality().hash(_expressions),
      levelId,
      level,
      playerId,
      gameSessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttemptImplCopyWith<_$AttemptImpl> get copyWith =>
      __$$AttemptImplCopyWithImpl<_$AttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttemptImplToJson(
      this,
    );
  }
}

abstract class _Attempt implements Attempt {
  const factory _Attempt(
      {final String? id,
      required final int score,
      required final int stars,
      required final List<double> plotPointsX,
      required final List<double> plotPointsY,
      required final InterfaceType interfaceType,
      required final List<String> expressions,
      required final String levelId,
      required final Level level,
      required final String? playerId,
      final String? gameSessionId}) = _$AttemptImpl;

  factory _Attempt.fromJson(Map<String, dynamic> json) = _$AttemptImpl.fromJson;

  @override
  String? get id;
  @override
  int get score;
  @override
  int get stars;
  @override
  List<double> get plotPointsX;
  @override
  List<double> get plotPointsY;
  @override
  InterfaceType get interfaceType;
  @override
  List<String> get expressions;
  @override
  String get levelId;
  @override
  Level get level;
  @override
  String? get playerId;
  @override
  String? get gameSessionId;
  @override
  @JsonKey(ignore: true)
  _$$AttemptImplCopyWith<_$AttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
