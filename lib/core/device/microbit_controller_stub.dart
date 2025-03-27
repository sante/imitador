import 'dart:async';
import 'package:imitador/core/common/logger.dart';
import 'microbit_platform.dart';

/// Stub implementation for non-web platforms
class MicrobitPlatformStub implements MicrobitPlatform {
  @override
  bool get isConnected => false;

  // Stream controller that does nothing
  final _dataStreamController = StreamController<double>.broadcast();
  @override
  Stream<double> get dataStream => _dataStreamController.stream;

  @override
  Future<void> initialize() async {
    Logger.d('Microbit not supported on this platform');
  }

  @override
  Future<bool> connect() async {
    Logger.d('Microbit not supported on this platform');
    return false;
  }

  @override
  Future<bool> disconnect() async {
    return true;
  }

  @override
  void dispose() {
    _dataStreamController.close();
  }
}

/// Factory to create the stub platform implementation
MicrobitPlatform createMicrobitPlatform() => MicrobitPlatformStub();
