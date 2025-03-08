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
  switch (json['runtimeType']) {
    case 'fixed':
      return FixedLevel.fromJson(json);
    case 'random':
      return RandomLevel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Level',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Level {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @PairConverter()
  Pair<double, double> get range => throw _privateConstructorUsedError;
  double get secondsDuration => throw _privateConstructorUsedError;
  LevelType get type => throw _privateConstructorUsedError;
  @ExpressionConverter()
  List<Expression>? get expressions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)
        fixed,
    required TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult? Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FixedLevel value) fixed,
    required TResult Function(RandomLevel value) random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedLevel value)? fixed,
    TResult? Function(RandomLevel value)? random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedLevel value)? fixed,
    TResult Function(RandomLevel value)? random,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
      @PairConverter() Pair<double, double> range,
      double secondsDuration,
      LevelType type,
      @ExpressionConverter() List<Expression> expressions});
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
    Object? range = null,
    Object? secondsDuration = null,
    Object? type = null,
    Object? expressions = null,
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
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Pair<double, double>,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LevelType,
      expressions: null == expressions
          ? _value.expressions!
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FixedLevelImplCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$FixedLevelImplCopyWith(
          _$FixedLevelImpl value, $Res Function(_$FixedLevelImpl) then) =
      __$$FixedLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @PairConverter() Pair<double, double> range,
      double secondsDuration,
      LevelType type,
      @ExpressionConverter() List<Expression> expressions});
}

/// @nodoc
class __$$FixedLevelImplCopyWithImpl<$Res>
    extends _$LevelCopyWithImpl<$Res, _$FixedLevelImpl>
    implements _$$FixedLevelImplCopyWith<$Res> {
  __$$FixedLevelImplCopyWithImpl(
      _$FixedLevelImpl _value, $Res Function(_$FixedLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? range = null,
    Object? secondsDuration = null,
    Object? type = null,
    Object? expressions = null,
  }) {
    return _then(_$FixedLevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Pair<double, double>,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LevelType,
      expressions: null == expressions
          ? _value._expressions
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FixedLevelImpl implements FixedLevel {
  _$FixedLevelImpl(
      {required this.id,
      required this.name,
      @PairConverter() required this.range,
      required this.secondsDuration,
      this.type = LevelType.position,
      @ExpressionConverter() required final List<Expression> expressions,
      final String? $type})
      : _expressions = expressions,
        $type = $type ?? 'fixed';

  factory _$FixedLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FixedLevelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @PairConverter()
  final Pair<double, double> range;
  @override
  final double secondsDuration;
  @override
  @JsonKey()
  final LevelType type;
  final List<Expression> _expressions;
  @override
  @ExpressionConverter()
  List<Expression> get expressions {
    if (_expressions is EqualUnmodifiableListView) return _expressions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expressions);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Level.fixed(id: $id, name: $name, range: $range, secondsDuration: $secondsDuration, type: $type, expressions: $expressions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedLevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.secondsDuration, secondsDuration) ||
                other.secondsDuration == secondsDuration) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._expressions, _expressions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, range, secondsDuration,
      type, const DeepCollectionEquality().hash(_expressions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FixedLevelImplCopyWith<_$FixedLevelImpl> get copyWith =>
      __$$FixedLevelImplCopyWithImpl<_$FixedLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)
        fixed,
    required TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) {
    return fixed(id, name, range, secondsDuration, type, expressions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult? Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) {
    return fixed?.call(id, name, range, secondsDuration, type, expressions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(id, name, range, secondsDuration, type, expressions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FixedLevel value) fixed,
    required TResult Function(RandomLevel value) random,
  }) {
    return fixed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedLevel value)? fixed,
    TResult? Function(RandomLevel value)? random,
  }) {
    return fixed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedLevel value)? fixed,
    TResult Function(RandomLevel value)? random,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FixedLevelImplToJson(
      this,
    );
  }
}

abstract class FixedLevel implements Level {
  factory FixedLevel(
          {required final String id,
          required final String name,
          @PairConverter() required final Pair<double, double> range,
          required final double secondsDuration,
          final LevelType type,
          @ExpressionConverter() required final List<Expression> expressions}) =
      _$FixedLevelImpl;

  factory FixedLevel.fromJson(Map<String, dynamic> json) =
      _$FixedLevelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @PairConverter()
  Pair<double, double> get range;
  @override
  double get secondsDuration;
  @override
  LevelType get type;
  @override
  @ExpressionConverter()
  List<Expression> get expressions;
  @override
  @JsonKey(ignore: true)
  _$$FixedLevelImplCopyWith<_$FixedLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RandomLevelImplCopyWith<$Res>
    implements $LevelCopyWith<$Res> {
  factory _$$RandomLevelImplCopyWith(
          _$RandomLevelImpl value, $Res Function(_$RandomLevelImpl) then) =
      __$$RandomLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Difficulty difficulty,
      LevelType type,
      @PairConverter() Pair<double, double> range,
      double secondsDuration,
      @ExpressionConverter() List<Expression>? expressions});
}

/// @nodoc
class __$$RandomLevelImplCopyWithImpl<$Res>
    extends _$LevelCopyWithImpl<$Res, _$RandomLevelImpl>
    implements _$$RandomLevelImplCopyWith<$Res> {
  __$$RandomLevelImplCopyWithImpl(
      _$RandomLevelImpl _value, $Res Function(_$RandomLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? difficulty = null,
    Object? type = null,
    Object? range = null,
    Object? secondsDuration = null,
    Object? expressions = freezed,
  }) {
    return _then(_$RandomLevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LevelType,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Pair<double, double>,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as double,
      expressions: freezed == expressions
          ? _value._expressions
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<Expression>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RandomLevelImpl implements RandomLevel {
  _$RandomLevelImpl(
      {required this.id,
      required this.name,
      required this.difficulty,
      this.type = LevelType.position,
      @PairConverter() required this.range,
      required this.secondsDuration,
      @ExpressionConverter() final List<Expression>? expressions,
      final String? $type})
      : _expressions = expressions,
        $type = $type ?? 'random';

  factory _$RandomLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RandomLevelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Difficulty difficulty;
  @override
  @JsonKey()
  final LevelType type;
  @override
  @PairConverter()
  final Pair<double, double> range;
  @override
  final double secondsDuration;
  final List<Expression>? _expressions;
  @override
  @ExpressionConverter()
  List<Expression>? get expressions {
    final value = _expressions;
    if (value == null) return null;
    if (_expressions is EqualUnmodifiableListView) return _expressions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Level.random(id: $id, name: $name, difficulty: $difficulty, type: $type, range: $range, secondsDuration: $secondsDuration, expressions: $expressions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomLevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.secondsDuration, secondsDuration) ||
                other.secondsDuration == secondsDuration) &&
            const DeepCollectionEquality()
                .equals(other._expressions, _expressions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      difficulty,
      type,
      range,
      secondsDuration,
      const DeepCollectionEquality().hash(_expressions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RandomLevelImplCopyWith<_$RandomLevelImpl> get copyWith =>
      __$$RandomLevelImplCopyWithImpl<_$RandomLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)
        fixed,
    required TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) {
    return random(
        id, name, difficulty, type, range, secondsDuration, expressions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult? Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) {
    return random?.call(
        id, name, difficulty, type, range, secondsDuration, expressions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            LevelType type,
            @ExpressionConverter() List<Expression> expressions)?
        fixed,
    TResult Function(
            String id,
            String name,
            Difficulty difficulty,
            LevelType type,
            @PairConverter() Pair<double, double> range,
            double secondsDuration,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) {
    if (random != null) {
      return random(
          id, name, difficulty, type, range, secondsDuration, expressions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FixedLevel value) fixed,
    required TResult Function(RandomLevel value) random,
  }) {
    return random(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedLevel value)? fixed,
    TResult? Function(RandomLevel value)? random,
  }) {
    return random?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedLevel value)? fixed,
    TResult Function(RandomLevel value)? random,
    required TResult orElse(),
  }) {
    if (random != null) {
      return random(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RandomLevelImplToJson(
      this,
    );
  }
}

abstract class RandomLevel implements Level {
  factory RandomLevel(
          {required final String id,
          required final String name,
          required final Difficulty difficulty,
          final LevelType type,
          @PairConverter() required final Pair<double, double> range,
          required final double secondsDuration,
          @ExpressionConverter() final List<Expression>? expressions}) =
      _$RandomLevelImpl;

  factory RandomLevel.fromJson(Map<String, dynamic> json) =
      _$RandomLevelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  Difficulty get difficulty;
  @override
  LevelType get type;
  @override
  @PairConverter()
  Pair<double, double> get range;
  @override
  double get secondsDuration;
  @override
  @ExpressionConverter()
  List<Expression>? get expressions;
  @override
  @JsonKey(ignore: true)
  _$$RandomLevelImplCopyWith<_$RandomLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
