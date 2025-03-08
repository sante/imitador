import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/model/level/level.dart';
import 'package:imitador/ui/section/level/level_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class LevelSectionRouter extends SectionRouter {
  final Level level;

  const LevelSectionRouter({
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (BuildContext context) => LevelSectionCubit(level: level),
    child: const AutoRouter(),
  );
}
