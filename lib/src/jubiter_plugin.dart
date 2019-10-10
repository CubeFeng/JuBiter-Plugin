part of jubiter_plugin;


class JuBiterPlugin {

  static const String METHOD_CHANNEL_NAME = 'plugin';

  static const MethodChannel _channel = const MethodChannel(METHOD_CHANNEL_NAME);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> generateMnemonic(ENUM_MNEMONIC_STRENGTH strength) async {
    Uint8List result = await _channel.invokeMethod("generateMnemonic", strength.value);
    return String.fromCharCodes(result);
  }



}
