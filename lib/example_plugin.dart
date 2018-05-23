import 'dart:async';

import 'package:flutter/services.dart';

class ExamplePlugin {
  static const MethodChannel _channel = const MethodChannel('example_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get randomString async =>
      await _channel.invokeMethod('randomString');

  static void callTimer(Future<dynamic> callback(MethodCall call)) =>
      _channel.setMethodCallHandler(callback);
}
