import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:rongta_printer/core/types.dart';
import 'package:rongta_printer/rongta_printer_platform_interface.dart';
import 'package:rongta_printer/rongta_printer_method_channel.dart';

class MockRongtaPrinterPlatform implements RongtaPrinterPlatform {
  @override
  Future<void> init({
    required String macAddress,
    OnPrinterConnectionChange? onPrinterConnectionChange,
    OnPrinterOperationChange? onDocPrinted,
  }) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> print({required Uint8List doc}) {
    // TODO: implement print
    throw UnimplementedError();
  }
}

void main() {
  final RongtaPrinterPlatform initialPlatform = RongtaPrinterPlatform.instance;

  test('$MethodChannelRongtaPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRongtaPrinter>());
  });

  test('getPlatformVersion', () async {
    // RongtaPrinter rongtaPrinterPlugin = RongtaPrinter();
    MockRongtaPrinterPlatform fakePlatform = MockRongtaPrinterPlatform();
    RongtaPrinterPlatform.instance = fakePlatform;

    // expect(await rongtaPrinterPlugin.getPlatformVersion(), '42');
  });
}
