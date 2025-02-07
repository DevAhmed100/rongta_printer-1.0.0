import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import 'core/types.dart';
import 'helpers/widget_to_image_converter.dart';
import 'rongta_printer_platform_interface.dart';

/// A class that provides high-level methods for interacting with a Rongta printer.
class RongtaPrinter {
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
  }) async {
    return await RongtaPrinterPlatform.instance.init(
      macAddress: macAddress,
      onPrinterConnectionChange: onPrinterConnectionChange,
      onDocPrinted: onDocPrinted,
    );
  }

  /// Prints a document using the Rongta printer.
  ///
  /// The [context] parameter represents the build context.
  /// The [doc] parameter specifies the widget to be printed as a document.
  ///
  /// Returns a [Future] that completes with a [Uint8List] containing the image data
  ///   representing the printed document.
  Future<Uint8List> print(
    BuildContext context, {
    required Widget doc,
  }) async {
    return await RongtaPrinterPlatform.instance.print(
      doc: await createImageFromWidget(context, doc),
    );
  }
}
