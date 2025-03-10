import 'package:freezed_annotation/freezed_annotation.dart';

enum UserType {
  @JsonValue("STUDENT") student,
  @JsonValue("TEACHER") teacher,
}
