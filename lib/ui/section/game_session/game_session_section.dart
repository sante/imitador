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
      child: MultiBlocListener(
        listeners: [
          BlocListener<GameSessionSectionCubit, GameSessionSectionState>(
            listenWhen: (previous, current) =>
                previous.session?.ended != current.session?.ended &&
                current.session?.ended == true,
            listener: (context, state) {
              if (state.session?.ended == true) {
                context.router.replace(GameSessionResultsRoute());
              }
            },
          ),
          BlocListener<GameSessionSectionCubit, GameSessionSectionState>(
            listenWhen: (previous, current) =>
                previous.navigateToLevelId != current.navigateToLevelId &&
                current.navigateToLevelId != null,
            listener: (context, state) {
              if (state.navigateToLevelId != null && state.activity != null) {
                // Find the level with the matching ID
                final levelToNavigate = state.activity!.levels.firstWhere(
                  (level) => level.id == state.navigateToLevelId,
                  orElse: () => state.activity!.levels.first,
                );

                // Set the current level
                context
                    .read<GameSessionSectionCubit>()
                    .setCurrentLevel(levelToNavigate);

                // Navigate to the level screen
                context.router.replace(SessionActivityLevelRoute());

                // Reset the navigateToLevelId to avoid repeated navigation
                context
                    .read<GameSessionSectionCubit>()
                    .resetNavigateToLevelId();
              }
            },
          ),
          BlocListener<GameSessionSectionCubit, GameSessionSectionState>(
            listenWhen: (previous, current) =>
                previous.showPlotResult != current.showPlotResult &&
                current.showPlotResult == true,
            listener: (context, state) {
              if (state.showPlotResult == true) {
                // TODO: Implement show plot result functionality for students
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('TODO: Show plot result functionality'),
                    duration: Duration(seconds: 3),
                  ),
                );

                // Reset the showPlotResult to avoid repeated notifications
                context.read<GameSessionSectionCubit>().resetShowPlotResult();
              }
            },
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
