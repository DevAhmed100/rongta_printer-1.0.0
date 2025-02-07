import Flutter
import UIKit

public class RongtaPrinterPlugin: NSObject, FlutterPlugin {
    var controller : FlutterViewController!
    var channel: FlutterMethodChannel!
    var printer: Printer!

    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = RongtaPrinterPlugin()
        instance.channel = FlutterMethodChannel(name: "rongta_printer/channel", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: instance.channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? Dictionary<String,Any>
            if (call.method == "init") {
                let macAddress: String = (args!["mac_address"] as? String)!

                self.initPrinter(macAddress: macAddress, result: result)
            } else if (call.method == "print") {
                let receipt: FlutterStandardTypedData = (args!["doc"] as? FlutterStandardTypedData)!

                self.printReceipt(receipt: receipt, result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }

            return
    }

    private func initPrinter(macAddress: String, result: FlutterResult) {
        let blueToothPI = BlueToothFactory.create(BlueToothKind_Classic)
        blueToothPI?.mtuLength = 100
        blueToothPI?.sendDelayMS = 20
        blueToothPI?.address = macAddress
        blueToothPI?.printerCmdtype = PrinterCmdESC

    printer = ThermalPrinterFactory.create()
        printer.printerPi = blueToothPI
        try printer.open()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handlePrinterConnectedNotification(notification:)),
            name: NSNotification.Name.PrinterConnected,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handlePrinterDisconnectedNotification(notification:)),
            name: NSNotification.Name.PrinterDisconnected,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handlePrinterDataChangeNotification(notification:)),
            name: NSNotification.Name(rawValue: BleDeviceDataChanged),
            object: nil
        )
    }

    private func printReceipt(receipt: FlutterStandardTypedData, result: FlutterResult) {
        let escCmd = ESCFactory.create()

        let bitmapSetting: BitmapSetting = printer.bitmapSetts
        bitmapSetting.alignmode = Align_Center
        bitmapSetting.limitWidth = 72*8;

        let receiptImage = UIImage(data: receipt.data)!
        let data = escCmd!.getBitMapCmd(bitmapSetting, image: receiptImage)
        escCmd!.append(data)

        printer.writeAsync(escCmd!.getCmd())
    }

    @objc func handlePrinterConnectedNotification(notification: Notification) {
        handlePrinterConnected()
    }

    private func handlePrinterConnected() {
        channel.invokeMethod("on_printer_connected", arguments: nil)
    }

    @objc func handlePrinterDisconnectedNotification(notification: Notification) {
        handlePrinterDisconnected()
    }

    private func handlePrinterDisconnected() {
        channel.invokeMethod("on_printer_disconnected", arguments: nil)
    }

    @objc func handlePrinterDataChangeNotification(notification: Notification) {
        handlePrinterDataChange()
    }

    private func handlePrinterDataChange() {
        channel.invokeMethod("on_printer_write_completion", arguments: nil)
    }
}
