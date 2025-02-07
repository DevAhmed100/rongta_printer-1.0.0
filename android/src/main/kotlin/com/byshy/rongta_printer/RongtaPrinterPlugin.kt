package com.byshy.rongta_printer

import android.bluetooth.BluetoothAdapter
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Handler
import android.os.Looper
import com.rt.printerlibrary.bean.BluetoothEdrConfigBean
import com.rt.printerlibrary.cmd.EscFactory
import com.rt.printerlibrary.enumerate.CommonEnum
import com.rt.printerlibrary.factory.cmd.CmdFactory
import com.rt.printerlibrary.factory.connect.BluetoothFactory
import com.rt.printerlibrary.factory.connect.PIFactory
import com.rt.printerlibrary.factory.printer.ThermalPrinterFactory
import com.rt.printerlibrary.printer.RTPrinter
import com.rt.printerlibrary.setting.BitmapSetting
import com.rt.printerlibrary.utils.ConnectListener

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.rt.printerlibrary.setting.CommonSetting as CommonSetting1

/** RongtaPrinterPlugin */
class RongtaPrinterPlugin : FlutterPlugin, MethodCallHandler, ConnectListener {
    private lateinit var channel: MethodChannel
    private lateinit var configObj: BluetoothEdrConfigBean
    private var rtPrinter: RTPrinter<BluetoothEdrConfigBean>? = null
    private val printerFactory: ThermalPrinterFactory = ThermalPrinterFactory()

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "rongta_printer/channel"
        )

        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "init" -> {
                val macAddress: String? = call.argument("mac_address")
                init(macAddress!!)
            }
            "print" -> {
                val logoPath: ByteArray? = call.argument("doc")
                printReceipt(logoPath!!)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun init(macAddress: String) {
        val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(macAddress)

        configObj = BluetoothEdrConfigBean(device)
        rtPrinter = (printerFactory).create() as RTPrinter<BluetoothEdrConfigBean>?

        val bluetoothEdrConfigBean = configObj

        connectBluetooth(bluetoothEdrConfigBean)
    }

    private fun connectBluetooth(bluetoothEdrConfigBean: BluetoothEdrConfigBean) {
        val piFactory: PIFactory = BluetoothFactory()
        val printerInterface = piFactory.create()

        printerInterface.configObject = bluetoothEdrConfigBean

        rtPrinter!!.setPrinterInterface(printerInterface)
        rtPrinter!!.setConnectListener(this)

        try {
            rtPrinter!!.connect(bluetoothEdrConfigBean)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun printReceipt(logo: ByteArray) {
        val commonSetting = CommonSetting1()
        val escFac: CmdFactory = EscFactory()
        val escCmd = escFac.create()

        commonSetting.align = CommonEnum.ALIGN_MIDDLE
        escCmd.append(escCmd.getCommonSettingCmd(commonSetting))

        val bitmapSetting = BitmapSetting()
        bitmapSetting.bimtapLimitWidth = 500

        val bmp = BitmapFactory.decodeByteArray(logo, 0, logo.size)
        escCmd.append(escCmd.getBitmapCmd(bitmapSetting, Bitmap.createBitmap(bmp)))

        rtPrinter!!.writeMsgAsync(escCmd.appendCmds)
    }

    override fun onPrinterConnected(p0: Any?) {
        Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("on_printer_connected", null)
        }
    }

    override fun onPrinterDisconnect(p0: Any?) {
        Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("on_printer_disconnected", null)
        }
    }

    override fun onPrinterWritecompletion(p0: Any?) {
        Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("on_printer_write_completion", null)
        }
    }
}
