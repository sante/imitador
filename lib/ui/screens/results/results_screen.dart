import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/helper/expressions_helper.dart';
import 'package:imitador/model/level/level.dart';

import 'results_cubit.dart';

@RoutePage()
class ResultsScreen extends StatelessWidget {
  final List<Pair<double, double>> samples;
  final Level level;

  const ResultsScreen({
    required this.samples,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ResultsCubit(),
        child: _ResultsContentScreen(
          samples: samples,
          level: level,
        ),
      );
}

class _ResultsContentScreen extends StatelessWidget {
  final List<Pair<double, double>> samples;
  final Level level;


  const _ResultsContentScreen({
    required this.samples,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final distance = level.expressions!.getDistance(samples);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.h,
            children: [
              const Text("Distancia"),
              Text(distance.toString()),
              const Text("Puntaje"),
              Text(getScore(distance).toString()),
            ],
          ),
        ),
      );
  }
}

int getScore(double distance) => switch (distance) {
      < 1.5 => 4,
      < 3.5 => 3,
      < 6 => 2,
      < 10 => 1,
      _ => 0,
    };
