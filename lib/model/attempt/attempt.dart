import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/model/enum/interface_type.dart';
import 'package:imitador/model/level/level.dart';
import 'package:math_expressions/math_expressions.dart';

import '../level_expression/level_expression.dart';

part 'attempt.freezed.dart';

part 'attempt.g.dart';

@freezed
class Attempt with _$Attempt {
  const factory Attempt({
    String? id,
    required int score,
    required int stars,
    required List<double> plotPointsX,
    required List<double> plotPointsY,
    required InterfaceType interfaceType,
    required List<String> expressions,
    required String levelId,
    required Level level,
    required String? playerId,
    String? gameSessionId,
  }) = _Attempt;

  factory Attempt.fromJson(Map<String, dynamic> json) =>
      _$AttemptFromJson(json);
}
