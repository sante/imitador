import 'dart:async';

/// Common interface for microbit functionality across platforms
abstract class MicrobitPlatform {
  bool get isConnected;
  Stream<double> get dataStream;

  Future<void> initialize();
  Future<bool> connect();
  Future<bool> disconnect();
  void dispose();
}

/// Factory to create the appropriate platform implementation
/// This will be overridden by the platform-specific implementation
MicrobitPlatform createMicrobitPlatform() {
  throw UnsupportedError(
    'Cannot create a MicrobitPlatform without the packages that define the implementation',
  );
}
