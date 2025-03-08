import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class GameSessionSectionRouter extends SectionRouter {
  final GameSession session;

  const GameSessionSectionRouter({
    required this.session,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (BuildContext context) => GameSessionSectionCubit(session: session),
    child: const AutoRouter(),
  );
}
