import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/core/common/config.dart';
import 'package:imitador/ui/section/game_session/game_session_section_cubit.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

@RoutePage()
class GameSessionLobbyScreen extends StatefulWidget {
  const GameSessionLobbyScreen({super.key});

  @override
  State<GameSessionLobbyScreen> createState() => _GameSessionLobbyScreenState();
}

class _GameSessionLobbyScreenState extends State<GameSessionLobbyScreen> {
  IO.Socket? socket;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    _initSocket();
  }

  void _initSocket() {
    // Initialize socket
    socket = IO.io(
      Config.socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    // Set up socket event handlers
    socket!.onConnect((_) {
      setState(() {
        isConnected = true;
      });
      _joinGame();
    });

    socket!.onDisconnect((_) {
      setState(() {
        isConnected = false;
      });
    });

    socket!.onConnectError((error) {
      print('Socket connection error: $error');
    });

    // Connect to the socket server
    socket!.connect();
  }

  void _joinGame() {
    final gameSessionCubit = context.read<GameSessionSectionCubit>();
    final gameId = gameSessionCubit.state.gameId;

    if (gameId != null) {
      print('Joining game with ID: $gameId');
      socket!.emit('game:join', {'gameId': gameId});
    } else {
      print('Cannot join game: game ID is null');
    }
  }

  @override
  void dispose() {
    socket?.disconnect();
    socket?.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: 20),
                  Text(
                    'Activity ID: ${state.activityId ?? "Not available"}',
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
                  'Connection: ${isConnected ? "Connected" : "Disconnected"}',
                  style: TextStyle(
                    fontSize: 16,
                    color: isConnected ? Colors.green : Colors.red,
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
