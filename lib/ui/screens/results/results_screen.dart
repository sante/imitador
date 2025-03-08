import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/model/attempt/attempt.dart';
import 'package:imitador/model/enum/play_session_type.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';


@RoutePage()
class ResultsScreen extends StatelessWidget {
  final PlaySessionType sessionType;

  const ResultsScreen({
    this.sessionType = PlaySessionType.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => switch (sessionType) {
        PlaySessionType.level =>
          BlocBuilder<LevelSectionCubit, LevelSectionState>(
            builder: (context, state) => _ResultsContentScreen(
              attempt: state.attempts.last,
            ),
          ),
        // TODO: Handle this case.
        PlaySessionType.activity => throw UnimplementedError(),
        // TODO: Handle this case.
        PlaySessionType.gameSession => throw UnimplementedError(),
      };
}

class _ResultsContentScreen extends StatelessWidget {
  final Attempt attempt;
  final bool canSelectLevel;

  const _ResultsContentScreen({
    required this.attempt,
    this.canSelectLevel = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.h,
          children: [
            const Text("Distancia"),
            Text(attempt.score.toString()),
            const Text("Puntaje"),
            Text(attempt.stars.toString()),
          ],
        ),
      ),
    );
  }
}

