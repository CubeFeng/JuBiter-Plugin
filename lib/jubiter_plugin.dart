import 'dart:async';

import 'package:flutter/services.dart';

class JuBiterPlugin {

  static const String METHOD_CHANNEL_NAME = 'plugin';

  static const MethodChannel _channel = const MethodChannel(METHOD_CHANNEL_NAME);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> generateMnemonic() async {
    final String mnemonic = await _channel.invokeMethod("invokeMethod");
    return mnemonic;
}

}
