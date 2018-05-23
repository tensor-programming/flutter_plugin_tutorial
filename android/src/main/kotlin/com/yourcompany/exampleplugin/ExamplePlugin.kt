package com.yourcompany.exampleplugin

import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

class ExamplePlugin(): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
      val channel = MethodChannel(registrar.messenger(), "example_plugin")
      channel.setMethodCallHandler(ExamplePlugin())

      var x = 0
      val timer = Timer()
      timer.scheduleAtFixedRate(object:TimerTask(){
          override fun run() {
              channel.invokeMethod("callTimer", x++)
          }
      }, 0, 1000)
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result): Unit {
    when (call.method) {
        "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
        "randomString" -> result.success("This is our Random String")
        else -> result.notImplemented()
    }
  }
}
