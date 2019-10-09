import 'dart:async';
import 'dart:core';

import 'package:flutter/services.dart';

class JuBiterPlugin {

  static const String METHOD_CHANNEL_NAME = 'plugin';

  static const MethodChannel _channel = const MethodChannel(METHOD_CHANNEL_NAME);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> generateMnemonic() async {
    List<int> result = await _channel.invokeMethod("generateMnemonic");
    return String.fromCharCodes(result);
  }



}
