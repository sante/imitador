// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_selector_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LevelSelectorState {
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
    required TResult Function(_LevelSelectorState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LevelSelectorState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LevelSelectorState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelSelectorStateCopyWith<$Res> {
  factory $LevelSelectorStateCopyWith(
          LevelSelectorState value, $Res Function(LevelSelectorState) then) =
      _$LevelSelectorStateCopyWithImpl<$Res, LevelSelectorState>;
}

/// @nodoc
class _$LevelSelectorStateCopyWithImpl<$Res, $Val extends LevelSelectorState>
    implements $LevelSelectorStateCopyWith<$Res> {
  _$LevelSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LevelSelectorStateImplCopyWith<$Res> {
  factory _$$LevelSelectorStateImplCopyWith(_$LevelSelectorStateImpl value,
          $Res Function(_$LevelSelectorStateImpl) then) =
      __$$LevelSelectorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LevelSelectorStateImplCopyWithImpl<$Res>
    extends _$LevelSelectorStateCopyWithImpl<$Res, _$LevelSelectorStateImpl>
    implements _$$LevelSelectorStateImplCopyWith<$Res> {
  __$$LevelSelectorStateImplCopyWithImpl(_$LevelSelectorStateImpl _value,
      $Res Function(_$LevelSelectorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LevelSelectorStateImpl implements _LevelSelectorState {
  const _$LevelSelectorStateImpl();

  @override
  String toString() {
    return 'LevelSelectorState.state()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LevelSelectorStateImpl);
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
    required TResult Function(_LevelSelectorState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LevelSelectorState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LevelSelectorState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _LevelSelectorState implements LevelSelectorState {
  const factory _LevelSelectorState() = _$LevelSelectorStateImpl;
}
