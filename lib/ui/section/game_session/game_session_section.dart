import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class GameSessionSectionRouter extends SectionRouter {
  const GameSessionSectionRouter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = GameSessionSectionCubit();

    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocListener<GameSessionSectionCubit, GameSessionSectionState>(
        listenWhen: (previous, current) =>
            previous.session?.ended != current.session?.ended &&
            current.session?.ended == true,
        listener: (context, state) {
          if (state.session?.ended == true) {
            context.router.replace(GameSessionResultsRoute());
          }
        },
        child: const AutoRouter(),
      ),
    );
  }
}
