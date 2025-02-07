/// [PrinterConnectionStatus] Represents the different connection statuses of a printer.
enum PrinterConnectionStatus {
  /// Initial connection status.
  initial,

  /// Loading connection status.
  loading,

  /// Connected connection status.
  connected,

  /// Disconnected connection status.
  disconnected,
}

/// [PrinterOperationStatus] Represents the different operation statuses of a printer.
enum PrinterOperationStatus {
  /// Transmitting operation status.
  transmitting,

  /// Idle operation status.
  idle,
}

/// Extension on the `String` class providing conversion functions for converting strings to printer connection and operation statuses.
extension StringX on String {
  /// Converts a string to the corresponding [PrinterConnectionStatus] value.
  ///
  /// Returns the corresponding [PrinterConnectionStatus] value.
  PrinterConnectionStatus toPrinterStatus() {
    switch (this) {
      case 'initial':
        return PrinterConnectionStatus.initial;
      case 'loading':
        return PrinterConnectionStatus.loading;
      case 'connected':
        return PrinterConnectionStatus.connected;
      case 'disconnected':
        return PrinterConnectionStatus.disconnected;
      default:
        return PrinterConnectionStatus.initial;
    }
  }

  /// Converts a string to the corresponding [PrinterOperationStatus] value.
  ///
  /// Returns the corresponding [PrinterOperationStatus] value.
  PrinterOperationStatus toPrinterProcessStatus() {
    switch (this) {
      case 'transmitting':
        return PrinterOperationStatus.transmitting;
      case 'idle':
        return PrinterOperationStatus.idle;
      default:
        return PrinterOperationStatus.idle;
    }
  }
}

/// Extension on the [PrinterConnectionStatus] enumeration providing helper properties to check the connection status.
extension PrinterStatusX on PrinterConnectionStatus {
  /// Checks if the connection status is [PrinterConnectionStatus.initial].
  ///
  /// Returns `true` if the connection status is [PrinterConnectionStatus.initial], `false` otherwise.
  bool get isInitial => this == PrinterConnectionStatus.initial;

  /// Checks if the connection status is [PrinterConnectionStatus.loading].
  ///
  /// Returns `true` if the connection status is [PrinterConnectionStatus.loading], `false` otherwise.
  bool get isLoading => this == PrinterConnectionStatus.loading;

  /// Checks if the connection status is [PrinterConnectionStatus.connected].
  ///
  /// Returns `true` if the connection status is [PrinterConnectionStatus.connected], `false` otherwise.
  bool get isConnected => this == PrinterConnectionStatus.connected;

  /// Checks if the connection status is [PrinterConnectionStatus.disconnected].
  ///
  /// Returns `true` if the connection status is [PrinterConnectionStatus.disconnected], `false` otherwise.
  bool get isDisconnected => this == PrinterConnectionStatus.disconnected;
}

/// Extension on the [PrinterOperationStatus] enumeration providing helper properties to check the operation status.
extension PrinterProcessStatusX on PrinterOperationStatus {
  /// Checks if the operation status is [PrinterOperationStatus.idle].
  ///
  /// Returns `true` if the operation status is [PrinterOperationStatus.idle], `false` otherwise.
  bool get isIdle => this == PrinterOperationStatus.idle;

  /// Checks if the operation status is [PrinterOperationStatus.transmitting].
  ///
  /// Returns `true` if the operation status is [PrinterOperationStatus.transmitting], `false` otherwise.
  bool get isTransmitting => this == PrinterOperationStatus.transmitting;
}
