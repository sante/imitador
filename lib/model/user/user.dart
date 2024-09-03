import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable()
  factory User.student({
    required String username,
    String? photoUrl,
  }) = Student;

  @JsonSerializable()
  factory User.teacher({
    required String username,
    String? photoUrl,
  }) = Teacher;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
