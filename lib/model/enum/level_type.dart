import 'package:freezed_annotation/freezed_annotation.dart';

enum LevelType {
  @JsonValue("POSITION") position,
  @JsonValue("SPEED") speed,
}
