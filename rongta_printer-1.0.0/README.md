# rongta_printer

![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D0.0.1-blue.svg)
![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-android-lightgrey.svg)

A Flutter plugin for printing using Rongta thermal printers. 🖨️

## Features

- **Print anything** 🤯: Print any widget shape, bypassing the limitations of the Rongta native SDK.
- **Be aware of the printer status** 💡: Receive updates about printer connection and document transmission.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
plugin_name: ^1.0.0
```

## Setup

The code works for Android out of the box, and has 1 step to setup iOS.

### 🔧 iOS Setup

To run the plugin on iOS, you need to add the bluetooth framework, to do so please follow these steps:
1. Tap on runner from the left side navigator.
2. Select the target from the targets list.
3. Tap on build phases.
4. Add a new "Link Binary With Libraries" by hitting the + button.
5. Type "Bluetooth" in the search bar and choose the CoreBluetooth.framework.

![alt text](https://github.com/byshy/rongta_printer/blob/main/assets/images/ios_setup_steps.png?raw=true)

## Usage

Import the package into your Dart file:

```dart
import 'package:rongta_printer/rongta_printer.dart';
```

### Example

Initialize the connection with the printer:

```dart
...
final _rongtaPrinterPlugin = RongtaPrinter();

void onConnectionStatusChanged(PrinterConnectionStatus status) {...}
void onOperationStatusChanged(PrinterOperationStatus status) {...}
...
await _rongtaPrinterPlugin.init(
  macAddress: 'DC:0D:30:95:39:A2',
  onPrinterConnectionChange: onConnectionStatusChanged,
  onDocPrinted: onOperationStatusChanged,
);
...
```

Print your document:

```dart
...
_rongtaPrinterPlugin.print(
  doc: Column(
    children: const [
      FlutterLogo(),
      Text('Rongta printing example'),
    ],
  ),
);
...
```

## Known Issues ❗️

- Using `Image.memory` will not display anything, as the code loads images instantly, while loading from memory takes time.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## Acknowledgments

The code is built on top of the Rongta SDKs for Android and iOS, which can be found [here](https://www.rongtatech.com/category/downloads/4). 🙌
