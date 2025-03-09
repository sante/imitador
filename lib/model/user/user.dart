import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
sealed class User with _$User {

  @FreezedUnionValue("STUDENT")
  factory User.student({
    required String id,
    required String email,
    required String name,
  }) = Student;

  @FreezedUnionValue("TEACHER")
  factory User.teacher({
    required String id,
    required String email,
    required String name,
  }) = Teacher;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
