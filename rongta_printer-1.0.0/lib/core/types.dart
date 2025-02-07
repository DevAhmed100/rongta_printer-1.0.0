import 'enums.dart';

/// A callback function type used for handling printer connection status changes.
///
/// The [status] parameter represents the new printer connection status.
typedef OnPrinterConnectionChange = Function(PrinterConnectionStatus status);

/// A callback function type used for handling printer operation status changes.
///
/// The [operation] parameter represents the new printer operation status.
typedef OnPrinterOperationChange = Function(PrinterOperationStatus operation);
