import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/difficulty.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/model/level_expression/level_expression.dart';
import 'package:math_expressions/math_expressions.dart';

part 'activity.freezed.dart';

part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity {

  const factory Activity({
    required String id,
    required String name,
    required List<Level> levels,
  }) = _Activity;


  factory Activity.fromJson(Map<String, Object?> json) => _$ActivityFromJson(json);
}
