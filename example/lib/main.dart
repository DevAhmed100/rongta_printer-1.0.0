import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rongta_printer/core/enums.dart';
import 'package:rongta_printer/rongta_printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PrinterConnectionStatus connectionStatus = PrinterConnectionStatus.initial;
  PrinterOperationStatus operationStatus = PrinterOperationStatus.idle;

  final _rongtaPrinterPlugin = RongtaPrinter();

  @override
  void initState() {
    super.initState();
    initRongtaPlugin();
  }

  void onConnectionStatusChanged(PrinterConnectionStatus status) {
    log(connectionStatus.name, name: 'onConnectionStatusChanged');

    setState(() {
      connectionStatus = status;
    });
  }

  void onOperationStatusChanged(PrinterOperationStatus status) {
    log(operationStatus.name, name: 'onOperationStatusChanged');

    setState(() {
      operationStatus = status;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initRongtaPlugin() async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        connectionStatus = PrinterConnectionStatus.loading;

        log(connectionStatus.name, name: 'initRongtaPlugin');

        setState(() {});
      });

      await _rongtaPrinterPlugin.init(
        macAddress: 'DC:0D:30:95:39:A2',
        onPrinterConnectionChange: onConnectionStatusChanged,
        onDocPrinted: onOperationStatusChanged,
      );
    } on PlatformException {
      log(
        'Unable to initialize the rongta printer plugin',
        name: 'initRongtaPlugin',
      );
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  Widget? connectionStatusWidget() {
    switch (connectionStatus) {
      case PrinterConnectionStatus.initial:
        return null;
      case PrinterConnectionStatus.loading:
        return const CircularProgressIndicator();
      case PrinterConnectionStatus.connected:
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
        );
      case PrinterConnectionStatus.disconnected:
        return const Icon(
          Icons.error,
          color: Colors.red,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rongta printer example'),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('Printer connection status'),
              subtitle: Text(connectionStatus.name),
              trailing: connectionStatusWidget(),
            ),
            ListTile(
              title: const Text('Printer operation status'),
              subtitle: Text(operationStatus.name),
            ),
            ElevatedButton(
              onPressed: connectionStatus == PrinterConnectionStatus.connected
                  ? () {
                      _rongtaPrinterPlugin.print(
                        context,
                        doc: const Column(
                          children: [
                            FlutterLogo(),
                            Text('Rongta printing example'),
                          ],
                        ),
                      );
                    }
                  : null,
              child: const Text('Print a test doc'),
            ),
          ],
        ),
      ),
    );
  }
}
