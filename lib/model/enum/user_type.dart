import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/gen/assets.gen.dart';

enum UserType {
  @JsonValue("STUDENT") student,
  @JsonValue("TEACHER") teacher,
}

extension UserTypeExtensions on UserType {
  String get iconPath => switch (this) {
      UserType.student => Assets.images.iconStudent.path,
      UserType.teacher => Assets.images.iconTeacher.path
    };
}
