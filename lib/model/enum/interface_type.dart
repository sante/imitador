import 'package:freezed_annotation/freezed_annotation.dart';

enum InterfaceType {
  @JsonValue("SENSOR") sensor,
  @JsonValue("MOUSE") mouse,
}
