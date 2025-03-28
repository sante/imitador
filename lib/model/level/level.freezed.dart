// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Level _$LevelFromJson(Map<String, dynamic> json) {
  return _Level.fromJson(json);
}

/// @nodoc
mixin _$Level {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Difficulty? get difficulty => throw _privateConstructorUsedError;
  double get minPosition => throw _privateConstructorUsedError;
  double get maxPosition => throw _privateConstructorUsedError;
  @JsonKey(name: "duration")
  double get secondsDuration => throw _privateConstructorUsedError;
  LevelType get type => throw _privateConstructorUsedError;
  List<String> get positionExpressions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelCopyWith<Level> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelCopyWith<$Res> {
  factory $LevelCopyWith(Level value, $Res Function(Level) then) =
      _$LevelCopyWithImpl<$Res, Level>;
  @useResult
  $Res call(
      {String id,
      String name,
      Difficulty? difficulty,
      double minPosition,
      double maxPosition,
      @JsonKey(name: "duration") double secondsDuration,
      LevelType type,
      List<String> positionExpressions});
}

/// @nodoc
class _$LevelCopyWithImpl<$Res, $Val extends Level>
    implements $LevelCopyWith<$Res> {
  _$LevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? difficulty = freezed,
    Object? minPosition = null,
    Object? maxPosition = null,
    Object? secondsDuration = null,
    Object? type = null,
    Object? positionExpressions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty?,
      minPosition: null == minPosition
          ? _value.minPosition
          : minPosition // ignore: cast_nullable_to_non_nullable
              as double,
      maxPosition: null == maxPosition
          ? _value.maxPosition
          : maxPosition // ignore: cast_nullable_to_non_nullable
              as double,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LevelType,
      positionExpressions: null == positionExpressions
          ? _value.positionExpressions
          : positionExpressions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LevelImplCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$LevelImplCopyWith(
          _$LevelImpl value, $Res Function(_$LevelImpl) then) =
      __$$LevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Difficulty? difficulty,
      double minPosition,
      double maxPosition,
      @JsonKey(name: "duration") double secondsDuration,
      LevelType type,
      List<String> positionExpressions});
}

/// @nodoc
class __$$LevelImplCopyWithImpl<$Res>
    extends _$LevelCopyWithImpl<$Res, _$LevelImpl>
    implements _$$LevelImplCopyWith<$Res> {
  __$$LevelImplCopyWithImpl(
      _$LevelImpl _value, $Res Function(_$LevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? difficulty = freezed,
    Object? minPosition = null,
    Object? maxPosition = null,
    Object? secondsDuration = null,
    Object? type = null,
    Object? positionExpressions = null,
  }) {
    return _then(_$LevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty?,
      minPosition: null == minPosition
          ? _value.minPosition
          : minPosition // ignore: cast_nullable_to_non_nullable
              as double,
      maxPosition: null == maxPosition
          ? _value.maxPosition
          : maxPosition // ignore: cast_nullable_to_non_nullable
              as double,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LevelType,
      positionExpressions: null == positionExpressions
          ? _value._positionExpressions
          : positionExpressions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LevelImpl implements _Level {
  _$LevelImpl(
      {required this.id,
      required this.name,
      required this.difficulty,
      required this.minPosition,
      required this.maxPosition,
      @JsonKey(name: "duration") required this.secondsDuration,
      this.type = LevelType.position,
      required final List<String> positionExpressions})
      : _positionExpressions = positionExpressions;

  factory _$LevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LevelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Difficulty? difficulty;
  @override
  final double minPosition;
  @override
  final double maxPosition;
  @override
  @JsonKey(name: "duration")
  final double secondsDuration;
  @override
  @JsonKey()
  final LevelType type;
  final List<String> _positionExpressions;
  @override
  List<String> get positionExpressions {
    if (_positionExpressions is EqualUnmodifiableListView)
      return _positionExpressions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positionExpressions);
  }

  @override
  String toString() {
    return 'Level(id: $id, name: $name, difficulty: $difficulty, minPosition: $minPosition, maxPosition: $maxPosition, secondsDuration: $secondsDuration, type: $type, positionExpressions: $positionExpressions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.minPosition, minPosition) ||
                other.minPosition == minPosition) &&
            (identical(other.maxPosition, maxPosition) ||
                other.maxPosition == maxPosition) &&
            (identical(other.secondsDuration, secondsDuration) ||
                other.secondsDuration == secondsDuration) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._positionExpressions, _positionExpressions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      difficulty,
      minPosition,
      maxPosition,
      secondsDuration,
      type,
      const DeepCollectionEquality().hash(_positionExpressions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelImplCopyWith<_$LevelImpl> get copyWith =>
      __$$LevelImplCopyWithImpl<_$LevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LevelImplToJson(
      this,
    );
  }
}

abstract class _Level implements Level {
  factory _Level(
      {required final String id,
      required final String name,
      required final Difficulty? difficulty,
      required final double minPosition,
      required final double maxPosition,
      @JsonKey(name: "duration") required final double secondsDuration,
      final LevelType type,
      required final List<String> positionExpressions}) = _$LevelImpl;

  factory _Level.fromJson(Map<String, dynamic> json) = _$LevelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Difficulty? get difficulty;
  @override
  double get minPosition;
  @override
  double get maxPosition;
  @override
  @JsonKey(name: "duration")
  double get secondsDuration;
  @override
  LevelType get type;
  @override
  List<String> get positionExpressions;
  @override
  @JsonKey(ignore: true)
  _$$LevelImplCopyWith<_$LevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
