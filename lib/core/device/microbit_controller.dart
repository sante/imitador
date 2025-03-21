import 'dart:async';

// Only import the platform interface
import 'microbit_platform.dart';

// The implementation is imported directly by the factory
import 'microbit_controller_web.dart'
    if (dart.library.io) 'microbit_controller_stub.dart' as platform_impl;

/// A controller class to handle micro:bit USB communication
class MicrobitController {
  final MicrobitPlatform _platform = platform_impl.createMicrobitPlatform();

  static final MicrobitController _instance = MicrobitController._internal();
  factory MicrobitController() => _instance;
  MicrobitController._internal();

  bool get isConnected => _platform.isConnected;

  // Stream for micro:bit data
  Stream<double> get dataStream => _platform.dataStream;

  /// Initialize the controller and setup callbacks
  Future<void> initialize() async {
    await _platform.initialize();
  }

  /// Connect to micro:bit device
  Future<bool> connect() async {
    return await _platform.connect();
  }

  /// Disconnect from micro:bit device
  Future<bool> disconnect() async {
    return await _platform.disconnect();
  }

  /// Dispose resources
  void dispose() {
    _platform.dispose();
  }
}
