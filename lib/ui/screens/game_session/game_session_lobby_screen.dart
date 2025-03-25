import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';

@RoutePage()
class GameSessionLobbyScreen extends StatelessWidget {
  GameSessionLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Lobby'),
      ),
      body: BlocBuilder<GameSessionSectionCubit, GameSessionSectionState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.code != null) ...[
                  Text(
                    'Session Code: ${state.code}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Game ID: ${state.gameId ?? "Not available"}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ] else ...[
                  const Text(
                    'Waiting for session data...',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
                const SizedBox(height: 20),
                Text(
                  'Connection: ${state.isConnected ? "Connected" : "Disconnected"}',
                  style: TextStyle(
                    fontSize: 16,
                    color: state.isConnected ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
