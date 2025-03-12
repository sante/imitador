import 'dart:async';
import 'dart:js_interop';
import 'package:imitador/core/common/logger.dart';
import 'microbit_platform.dart';

// JS interop bindings
@JS('window')
external JSObject get _window;

extension on JSObject {
  external JSPromise connectMicrobit();
  external JSPromise disconnectMicrobit();
  external set flutterMicrobitCallback(JSFunction callback);
}

/// Web implementation of the MicrobitPlatform
class MicrobitPlatformWeb implements MicrobitPlatform {
  bool _isConnected = false;
  @override
  bool get isConnected => _isConnected;

  // Stream controller to expose micro:bit data
  final _dataStreamController = StreamController<double>.broadcast();
  @override
  Stream<double> get dataStream => _dataStreamController.stream;

  @override
  Future<void> initialize() async {
    try {
      // Create a callback for processing micro:bit data
      _window.flutterMicrobitCallback = ((num value) {
        try {
          final doubleValue = value.toDouble();
          _dataStreamController.add(doubleValue);
          // Logger.d('Received data from micro:bit: $doubleValue');
        } catch (e) {
          Logger.e('Error processing micro:bit data: $e');
        }
      }).toJS;

      Logger.d('MicrobitController initialized');
    } catch (e) {
      Logger.e('Error initializing micro:bit controller: $e');
    }
  }

  @override
  Future<bool> connect() async {
    if (_isConnected) return true;

    try {
      Logger.d('Attempting to connect to micro:bit via WebUSB');

      // Call the JavaScript function
      final result =
          await _window.connectMicrobit().toDart.then((value) => value == true);
      _isConnected = result;

      Logger.d(result
          ? 'Successfully connected to micro:bit'
          : 'Failed to connect to micro:bit');

      return result;
    } catch (e) {
      Logger.e('Error connecting to micro:bit: $e');
      return false;
    }
  }

  @override
  Future<bool> disconnect() async {
    if (!_isConnected) return true;

    try {
      // Call the JavaScript function
      final result = await _window
          .disconnectMicrobit()
          .toDart
          .then((value) => value == true);

      _isConnected = !result;
      Logger.d('Disconnected from micro:bit: $result');
      return result;
    } catch (e) {
      Logger.e('Error disconnecting from micro:bit: $e');
      return false;
    }
  }

  @override
  void dispose() {
    disconnect();
    _dataStreamController.close();
  }
}

/// Factory to create the web platform implementation
MicrobitPlatform createMicrobitPlatform() => MicrobitPlatformWeb();
