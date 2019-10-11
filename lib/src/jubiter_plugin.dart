part of jubiter_plugin;

class JuBiterPlugin {
  static const String NAMESPACE = '';
  static const String METHOD_CHANNEL_NAME = 'plugin';

  static const MethodChannel _channel =
      const MethodChannel(METHOD_CHANNEL_NAME);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<ResultString> generateMnemonic(
      ENUM_MNEMONIC_STRENGTH strength) async {
    Uint8List result =
        await _channel.invokeMethod('generateMnemonic', strength.value);
//    LogUtils.d('>>> length: ${result.lengthInBytes}');
    return ResultString.fromBuffer(result);
  }

  static Future<int> checkMnemonic(String mnemonic) async {
    return await _channel.invokeMethod('checkMnemonic', mnemonic);
  }

  static Future<ResultString> generateSeed(
      String mnemonic, String passphrase) async {
    Uint8List result = await _channel.invokeMethod('generateSeed',
        <String, String>{'mnemonic' : mnemonic, 'passphrase' : passphrase});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> seedToMasterPrivateKey(
      String seed, CURVES curves) async {
    Uint8List result = await _channel.invokeMethod(
        'seedToMasterPrivateKey', <String, dynamic>{'seed' : seed, 'curves' : curves.value});
    return ResultString.fromBuffer(result);
  }
}
