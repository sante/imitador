import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/gen/assets.gen.dart';
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
    return BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
      builder: (context, state) => MotionScaffold(
        extendBodyBehindAppBar: state.user?.id != state.creatorId,
        showTitle: false,
        backRoute: WelcomeRoute(),
        body: state.user?.id == state.creatorId
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
          child: state.session?.playing == true
              ? CountdownTimer(
                  onFinished: () =>
                      context.router.replace(const SessionLevelSelectorRoute()),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20.h,
                  children: [
                    if (state.code != null) ...[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 604.w,
                        ),
                        child: PulsingText(
                          text: context.localizations.waiting_for_more_players,
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8.w,
                        children: [
                          Assets.icons.icPerson.svg(
                            width: 48.r,
                            height: 48.r,
                          ),
                          Text(
                            state.session?.players.length.toString() ?? "0",
                            style:
                                context.theme.textTheme.headlineLarge?.copyWith(
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      Text(
                        context.localizations.waiting_for_session_data,
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ],
                ),
        ),
      );
}

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final void Function() onFinished;

  const CountdownTimer({
    required this.onFinished,
    this.seconds = 3,
    super.key,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _remainingSeconds--;
          });
        }
      });
    } else {
      widget.onFinished();
    }
    return Text(
      "$_remainingSeconds",
      style: context.theme.textTheme.headlineLarge?.copyWith(
        color: Colors.white,
      ),
    );
  }
}

class HostLobby extends StatelessWidget {
  const HostLobby({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => Center(
          child: Column(
            children: [
              if (state.code != null) ...[
                GestureDetector(
                  onTap: () async {
                    try {
                      await Clipboard.setData(
                        ClipboardData(
                          text: state.code ?? "",
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text(context.localizations.copied_snackbar)),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text(context.localizations.copy_error_snackbar),
                        ),
                      );
                    }
                  },
                  child: SheetContainer(
                    maxWidth: 604.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 34.h,
                      ),
                      child: Row(
                        spacing: 10.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            context.localizations
                                .session_code(state.code ?? ""),
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(
                              color: context.theme.colorScheme.surface,
                            ),
                          ),
                          Icon(
                            Icons.copy,
                            color: context.theme.colorScheme.secondary,
                            size: 36.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!(state.session?.playing ?? false)) ...[
                  SizedBox(
                    height: 116.h,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 604.w,
                    ),
                    child: PulsingText(
                      text: context.localizations.waiting_for_more_players,
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8.w,
                    children: [
                      Assets.icons.icPerson.svg(
                        width: 48.r,
                        height: 48.r,
                      ),
                      Text(
                        state.session?.players.length.toString() ?? "0",
                        style: context.theme.textTheme.headlineLarge?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                ] else
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: SheetContainer(
                      maxWidth: 604.w,
                      maxHeight: 607.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 40.h,
                          horizontal: 40.w,
                        ),
                        child: ScoreTable(
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
                SizedBox(
                  height: 45.h,
                ),
                PrimaryButton(
                  label: (state.session?.playing ?? false)
                      ? context.localizations.end_session
                      : context.localizations.start_game,
                  onPressed: () {
                    if (!(state.session?.playing ?? false)) {
                      context.read<GameSessionSectionCubit>().startGame();
                    } else {
                      context.read<GameSessionSectionCubit>().stopGame();
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      );
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
