import 'dart:typed_data';

import 'core/types.dart';
import 'rongta_printer_method_channel.dart';

/// An abstract class representing the Rongta printer platform.
abstract class RongtaPrinterPlatform {
  /// Constructs a RongtaPrinterPlatform.
  RongtaPrinterPlatform();

  /// The instance of the RongtaPrinterPlatform implementation to be used.
  static RongtaPrinterPlatform instance = MethodChannelRongtaPrinter();

  /// Initializes the Rongta printer with the provided parameters.
  ///
  /// The [macAddress] parameter specifies the MAC address of the printer.
  /// The [onPrinterConnectionChange] parameter (optional) is a callback function
  ///   that will be invoked when the printer connection status changes.
  /// The [onDocPrinted] parameter (optional) is a callback function that will be
  ///   invoked when a document is successfully printed.
  ///
  /// Returns a [Future] that completes when the initialization is finished.
  Future<void> init({
    required String macAddress,
    OnPrinterConnectionChange? onPrinterConnectionChange,
    OnPrinterOperationChange? onDocPrinted,
  });

  /// Prints a document using the Rongta printer.
  ///
  /// The [doc] parameter specifies the document as a [Uint8List] containing the
  ///   image data representing the document.
  ///
  /// Returns a [Future] that completes with a [Uint8List] containing the image data
  ///   representing the printed document.
  Future<Uint8List> print({
    required Uint8List doc,
  });
}
