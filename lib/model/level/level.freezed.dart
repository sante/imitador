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
    case 'activity':
      return Activity.fromJson(json);
    case 'random':
      return RandomLevel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Level',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Level {
  String get name => throw _privateConstructorUsedError;
  @ExpressionConverter()
  List<Expression>? get expressions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, @ExpressionConverter() List<Expression> expressions)
        activity,
    required TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult? Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Activity value) activity,
    required TResult Function(RandomLevel value) random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Activity value)? activity,
    TResult? Function(RandomLevel value)? random,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Activity value)? activity,
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
  $Res call({String name, @ExpressionConverter() List<Expression> expressions});
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
    Object? name = null,
    Object? expressions = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expressions: null == expressions
          ? _value.expressions!
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @ExpressionConverter() List<Expression> expressions});
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$LevelCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? expressions = null,
  }) {
    return _then(_$ActivityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expressions: null == expressions
          ? _value._expressions
          : expressions // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ActivityImpl implements Activity {
  _$ActivityImpl(
      {required this.name,
      @ExpressionConverter() required final List<Expression> expressions,
      final String? $type})
      : _expressions = expressions,
        $type = $type ?? 'activity';

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  final String name;
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
    return 'Level.activity(name: $name, expressions: $expressions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._expressions, _expressions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_expressions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, @ExpressionConverter() List<Expression> expressions)
        activity,
    required TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) {
    return activity(name, expressions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult? Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) {
    return activity?.call(name, expressions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) {
    if (activity != null) {
      return activity(name, expressions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Activity value) activity,
    required TResult Function(RandomLevel value) random,
  }) {
    return activity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Activity value)? activity,
    TResult? Function(RandomLevel value)? random,
  }) {
    return activity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Activity value)? activity,
    TResult Function(RandomLevel value)? random,
    required TResult orElse(),
  }) {
    if (activity != null) {
      return activity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class Activity implements Level {
  factory Activity(
          {required final String name,
          @ExpressionConverter() required final List<Expression> expressions}) =
      _$ActivityImpl;

  factory Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  String get name;
  @override
  @ExpressionConverter()
  List<Expression> get expressions;
  @override
  @JsonKey(ignore: true)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
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
      {String name,
      Difficulty difficulty,
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
    Object? name = null,
    Object? difficulty = null,
    Object? expressions = freezed,
  }) {
    return _then(_$RandomLevelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
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
      {required this.name,
      required this.difficulty,
      @ExpressionConverter() final List<Expression>? expressions,
      final String? $type})
      : _expressions = expressions,
        $type = $type ?? 'random';

  factory _$RandomLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RandomLevelImplFromJson(json);

  @override
  final String name;
  @override
  final Difficulty difficulty;
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
    return 'Level.random(name: $name, difficulty: $difficulty, expressions: $expressions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomLevelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality()
                .equals(other._expressions, _expressions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, difficulty,
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
            String name, @ExpressionConverter() List<Expression> expressions)
        activity,
    required TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)
        random,
  }) {
    return random(name, difficulty, expressions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult? Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
  }) {
    return random?.call(name, difficulty, expressions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, @ExpressionConverter() List<Expression> expressions)?
        activity,
    TResult Function(String name, Difficulty difficulty,
            @ExpressionConverter() List<Expression>? expressions)?
        random,
    required TResult orElse(),
  }) {
    if (random != null) {
      return random(name, difficulty, expressions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Activity value) activity,
    required TResult Function(RandomLevel value) random,
  }) {
    return random(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Activity value)? activity,
    TResult? Function(RandomLevel value)? random,
  }) {
    return random?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Activity value)? activity,
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
          {required final String name,
          required final Difficulty difficulty,
          @ExpressionConverter() final List<Expression>? expressions}) =
      _$RandomLevelImpl;

  factory RandomLevel.fromJson(Map<String, dynamic> json) =
      _$RandomLevelImpl.fromJson;

  @override
  String get name;
  Difficulty get difficulty;
  @override
  @ExpressionConverter()
  List<Expression>? get expressions;
  @override
  @JsonKey(ignore: true)
  _$$RandomLevelImplCopyWith<_$RandomLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
