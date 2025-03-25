import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';

@RoutePage()
class GameSessionTestScreen extends StatelessWidget {
  const GameSessionTestScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) => Center(
          child: Text(state.code ?? ""),
        ),
      );
}
