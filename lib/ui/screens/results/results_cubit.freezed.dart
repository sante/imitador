// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultsState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultsState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultsState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsStateCopyWith<$Res> {
  factory $ResultsStateCopyWith(
          ResultsState value, $Res Function(ResultsState) then) =
      _$ResultsStateCopyWithImpl<$Res, ResultsState>;
}

/// @nodoc
class _$ResultsStateCopyWithImpl<$Res, $Val extends ResultsState>
    implements $ResultsStateCopyWith<$Res> {
  _$ResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResultsStateImplCopyWith<$Res> {
  factory _$$ResultsStateImplCopyWith(
          _$ResultsStateImpl value, $Res Function(_$ResultsStateImpl) then) =
      __$$ResultsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResultsStateImplCopyWithImpl<$Res>
    extends _$ResultsStateCopyWithImpl<$Res, _$ResultsStateImpl>
    implements _$$ResultsStateImplCopyWith<$Res> {
  __$$ResultsStateImplCopyWithImpl(
      _$ResultsStateImpl _value, $Res Function(_$ResultsStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResultsStateImpl implements _ResultsState {
  const _$ResultsStateImpl();

  @override
  String toString() {
    return 'ResultsState.state()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() state,
  }) {
    return state();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? state,
  }) {
    return state?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultsState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultsState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultsState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _ResultsState implements ResultsState {
  const factory _ResultsState() = _$ResultsStateImpl;
}
