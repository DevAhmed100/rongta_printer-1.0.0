import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core/enums.dart';
import 'core/types.dart';
import 'rongta_printer_platform_interface.dart';

/// An implementation of [RongtaPrinterPlatform] that uses method channels.
class MethodChannelRongtaPrinter extends RongtaPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rongta_printer/channel');

  @override
  Future<void> init({
    required String macAddress,
    OnPrinterConnectionChange? onPrinterConnectionChange,
    OnPrinterOperationChange? onDocPrinted,
  }) async {
    // Set the method call handler to handle platform method calls.
    methodChannel.setMethodCallHandler((call) {
      switch (call.method) {
        case 'on_printer_connected':
          if (onPrinterConnectionChange != null) {
            onPrinterConnectionChange(PrinterConnectionStatus.connected);
          }
          break;
        case 'on_printer_disconnected':
          if (onPrinterConnectionChange != null) {
            onPrinterConnectionChange(PrinterConnectionStatus.disconnected);
          }
          break;
        case 'on_printer_write_completion':
          if (onDocPrinted != null) {
            onDocPrinted(PrinterOperationStatus.idle);
          }
          break;
      }
      return Future.value();
    });

    // Invoke the platform method 'init' with the provided parameters.
    return await methodChannel.invokeMethod(
      'init',
      {
        'mac_address': macAddress,
      },
    );
  }

  @override
  Future<Uint8List> print({
    required Uint8List doc,
  }) async {
    // Invoke the platform method 'print' with the provided document data.
    await methodChannel.invokeMethod(
      'print',
      {
        'doc': doc,
      },
    );

    return doc;
  }
}
