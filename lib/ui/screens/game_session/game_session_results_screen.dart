import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/screens/game_session/game_session_lobby_screen.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';
import 'package:imitador/ui/theme/components/score_table.dart';

@RoutePage()
class GameSessionResultsScreen extends StatelessWidget {
  GameSessionResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
      builder: (context, state) => MotionScaffold(
        showTitle: false,
        backRoute: WelcomeRoute(),
        body: state.user?.id == state.creatorId
            ? const TeacherResults()
            : const PlayerResults(),
      ),
    );
  }
}

class TeacherResults extends StatelessWidget {
  const TeacherResults({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: Center(
            child: SheetContainer(
              maxWidth: 1093.w,
              maxHeight: 900.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40.h,
                  horizontal: 40.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Resultados finales",
                        style: context.theme.textTheme.headlineLarge,
                      ),
                      SizedBox(height: 40.h),

                      // Create sorted list of players by score
                      Builder(
                        builder: (context) {
                          if (state.session == null) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final players = (state.session?.players ?? []);

                          // Only show loading if we have no players but know session exists
                          if (players.isEmpty) {
                            return const Center(
                              child: Text("No hay resultados disponibles"),
                            );
                          }

                          final sortedPlayers = players
                              .map((p) => (
                                    player: p,
                                    score: generalScore(p.score ?? [])
                                  ))
                              .sortedByDescending((it) => it.score)
                              .toList();

                          return Column(
                            children: [
                              // Top 3 players with medals
                              SizedBox(
                                width: double.infinity,
                                height: 210.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Second place (Silver)
                                    if (sortedPlayers.length > 1)
                                      _buildTopPlayer(
                                        context,
                                        sortedPlayers[1].player.name,
                                        sortedPlayers[1].score.toString(),
                                        Assets.images.medalSilver.path,
                                        44.w,
                                        72.h,
                                      ),

                                    SizedBox(width: 40.w),

                                    // First place (Gold)
                                    if (sortedPlayers.isNotEmpty)
                                      _buildTopPlayer(
                                        context,
                                        sortedPlayers[0].player.name,
                                        sortedPlayers[0].score.toString(),
                                        Assets.images.medalGold.path,
                                        51.w,
                                        84.h,
                                      ),

                                    SizedBox(width: 40.w),

                                    // Third place (Bronze)
                                    if (sortedPlayers.length > 2)
                                      _buildTopPlayer(
                                        context,
                                        sortedPlayers[2].player.name,
                                        sortedPlayers[2].score.toString(),
                                        Assets.images.medalBronze.path,
                                        38.w,
                                        63.h,
                                      ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 40.h),

                              // Remaining players
                              if (sortedPlayers.length > 3)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...sortedPlayers.sublist(3).mapIndexed(
                                          (index, entry) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 12.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  entry.player.name,
                                                  style: context.theme.textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                    color: context.theme
                                                        .colorScheme.surface,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(width: 12.w),
                                                Text(
                                                  entry.score.toString(),
                                                  style: context
                                                      .theme.textTheme.bodyLarge
                                                      ?.copyWith(
                                                    color: context.theme
                                                        .colorScheme.surface,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildTopPlayer(
    BuildContext context,
    String name,
    String score,
    String medalAsset,
    double medalWidth,
    double medalHeight,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage(medalAsset),
          width: medalWidth,
          height: medalHeight,
        ),
        SizedBox(height: 20.h),
        Text(
          name,
          style: context.theme.textTheme.headlineSmall?.copyWith(
            color: context.theme.colorScheme.surface,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          score,
          style: context.theme.textTheme.headlineMedium?.copyWith(
            color: context.theme.colorScheme.surface,
          ),
        ),
      ],
    );
  }
}

class PlayerResults extends StatelessWidget {
  const PlayerResults({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: Center(
            child: SheetContainer(
              maxWidth: 604.w,
              maxHeight: 800.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40.h,
                  horizontal: 40.w,
                ),
                child: SingleChildScrollView(
                  child: ScoreTable(
                    finalResults: true,
                    scores: Map.fromEntries(
                      (state.session?.players ?? []).map(
                        (p) => MapEntry(
                          p.name,
                          generalScore(p.score ?? []),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  int generalScore(List<Score> scores) {
    final Map<String, int> scoreMap = {};
    for (var score in scores) {
      scoreMap[score.levelId] ??= score.score;
      if (scoreMap[score.levelId]! < score.score) {
        scoreMap[score.levelId] = score.score;
      }
    }
    return scoreMap.values.sum();
  }
}
