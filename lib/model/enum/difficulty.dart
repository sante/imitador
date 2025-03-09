import 'package:freezed_annotation/freezed_annotation.dart';

enum Difficulty {
  @JsonValue("EASY") easy,
  @JsonValue("MEDIUM") medium,
  @JsonValue("HARD") hard,
}
