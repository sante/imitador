import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
sealed class User with _$User {

  factory User.student({
    required String id,
    required String email,
    required String name,
  }) = Student;

  factory User.teacher({
    required String id,
    required String email,
    required String name,
  }) = Teacher;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
