import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/model/game_session/game_session.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/score_table.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';

@RoutePage()
class GameSessionLobbyScreen extends StatelessWidget {
  GameSessionLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MotionScaffold(
      body: BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => state.user?.id == state.creatorId
            ? const HostLobby()
            : const PlayerLobby(),
      ),
    );
  }
}

class PlayerLobby extends StatelessWidget {
  const PlayerLobby({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20.h,
                children: [
                  if (state.code != null) ...[
                    Text(
                      'Sala: ${state.code}',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Jugadores:',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    Wrap(
                      spacing: 12.w,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        ...state.session?.players.map((player) {
                              return Text(
                                player.name,
                                style: context.theme.textTheme.headlineMedium
                                    ?.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              );
                            }) ??
                            [],
                      ],
                    ),
                  ] else ...[
                    Text(
                      'Waiting for session data...',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ],
              ),
              if (state.session?.playing == false)
                PulsingText(
                  text: 'Esperando que el anfitrión inicie la partida',
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                )
              else
                PrimaryButton(
                  label: "Empezar a jugar",
                  onPressed: () {
                    context.router.replace(const SessionLevelSelectorRoute());
                  },
                ),
            ],
          ),
        ),
      );
}

class HostLobby extends StatelessWidget {
  const HostLobby({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
          builder: (context, state) => Center(
                child: !(state.session?.playing ?? false)
                    ? Column(
                        children: [
                          if (state.code != null) ...[
                            Text(
                              'Sala: ${state.code}',
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Jugadores:',
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                            Wrap(
                              spacing: 12.w,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                ...state.session?.players.map((player) {
                                  return Text(
                                    player.name,
                                    style: context.theme.textTheme.headlineMedium
                                        ?.copyWith(
                                      color: context.theme.colorScheme.onSurface,
                                    ),
                                  );
                                }) ??
                                    [],
                              ],
                            ),
                          ] else ...[
                            Text(
                              'Waiting for session data...',
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                          PrimaryButton(
                            label: "Empezar juego",
                            onPressed: context
                                .read<GameSessionSectionCubit>()
                                .startGame,
                          ),
                        ],
                      )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sala: ${state.code}',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(
                            width: 600.w,
                            height: 800.h,
                            child: SheetContainer(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 40.h,
                                  horizontal: 70.w,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 40.h,
                                  children: [
                                    ScoreTable(
                                      scores: Map.fromEntries(
                                        (state.session?.players ?? []).map(
                                          (p) => MapEntry(
                                            p.name,
                                            generalScore(p.score ?? []),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: PrimaryButton(
                                        label: "Terminar juego",
                                        onPressed: () {
                                          context
                                              .read<GameSessionSectionCubit>()
                                              .stopGame();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
              ));
}

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

class PulsingText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const PulsingText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  State<PulsingText> createState() => _PulsingTextState();
}

class _PulsingTextState extends State<PulsingText> {
  bool _isHighOpacity = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _isHighOpacity = !_isHighOpacity;
        });
        _startAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isHighOpacity ? 1.0 : 0.6,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
