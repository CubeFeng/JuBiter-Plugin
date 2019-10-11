part of jubiter_plugin;

class JuBiterPlugin {
  static const String NAMESPACE = 'com.jubiter.plugin';
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
    return ResultString.fromBuffer(result);
  }

  static Future<int> checkMnemonic(String mnemonic) async {
    return await _channel.invokeMethod('checkMnemonic', mnemonic);
  }

  static Future<ResultString> generateSeed(
      String mnemonic, String passphrase) async {
    Uint8List result = await _channel.invokeMethod('generateSeed',
        <String, String>{'mnemonic': mnemonic, 'passphrase': passphrase});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> seedToMasterPrivateKey(
      String seed, CURVES curves) async {
    Uint8List result = await _channel.invokeMethod('seedToMasterPrivateKey',
        <String, dynamic>{'seed': seed, 'curves': curves.value});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultAny> getDeviceInfo(int deviceID) async {
    Uint8List result = await _channel.invokeMethod('getDeviceInfo', deviceID);
    return ResultAny.fromBuffer(result);
  }

  static Future<ResultString> getDeviceCert(int deviceID) async {
    Uint8List result = await _channel.invokeMethod('getDeviceCert', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> sendApdu(int deviceID, String apdu) async {
    Uint8List result = await _channel.invokeMethod(
        'sendApdu', <String, dynamic>{'deviceID': deviceID, 'apdu': apdu});
    return ResultString.fromBuffer(result);
  }

  static Future<bool> isInitialize(int deviceID) async {
    return await _channel.invokeMethod('isInitialize', deviceID);
  }

  static Future<bool> isBootLoader(int deviceID) async {
    return await _channel.invokeMethod('isBootLoader', deviceID);
  }

  static Future<ResultInt> setTimeout(int contextID, int timeout) async {
    return await _channel.invokeMethod('setTimeout',
        <String, dynamic>{'contextID': contextID, 'timeout': timeout});
  }

  static Future<ResultString> enumApplets(int deviceID) async {
    Uint8List result = await _channel.invokeMethod('enumApplets', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> enumSupportCoins(int deviceID) async {
    Uint8List result =
        await _channel.invokeMethod('enumSupportCoins', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> getAppletVersion(
      int deviceID, String appletID) async {
    Uint8List result = await _channel.invokeMethod('getAppletVersion',
        <String, dynamic>{'deviceID': deviceID, 'appletID': appletID});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultInt> queryBattery(int deviceID) async {
    Uint8List result = await _channel.invokeMethod('queryBattery', deviceID);
    return ResultInt.fromBuffer(result);
  }

  static Future<int> clearContext(int contextID) async {
    return await _channel.invokeMethod('clearContext', contextID);
  }

  static Future<int> showVirtualPWD(int contextID) async {
    return await _channel.invokeMethod('showVirtualPWD', contextID);
  }

  static Future<int> cancelVirtualPWD(int contextID) async {
    return await _channel.invokeMethod('cancelVirtualPWD', contextID);
  }

  static Future<ResultInt> verifyPIN(int contextID, String PIN) async {
    Uint8List result = await _channel.invokeMethod(
        'verifyPIN', <String, dynamic>{'contextID': contextID, 'PIN': PIN});
    return ResultInt.fromBuffer(result);
  }

  static Future<int> initDevice() async {
    return _channel.invokeMethod('initDevice');
  }

  // todo
  static Future<int> startScan() async {
    return null;
  }

  static Future<int> stopScan() async {
    return await _channel.invokeMethod('stopScan');
  }

  // todo
  static Future<int> connectDeviceAsync() async {
    return null;
  }

  static Future<int> cancelConnect(String macAddress) async {
    return await _channel.invokeMethod('cancelConnect', macAddress);
  }

  static Future<int> disconnectDevice(int deviceID) async {
    return await _channel.invokeMethod('disconnectDevice', deviceID);
  }

  static Future<bool> isConnected(int deviceID) async {
    return await _channel.invokeMethod('isConnected', deviceID);
  }

  /// BTC
  static Future<ResultInt> BTCCreateContext_Software(
      ContextCfgBTC config, String xPrikey) async {
    Uint8List result = await _channel.invokeMethod(
        'BTCCreateContext_Software', <String, dynamic>{
      'config': config.writeToBuffer(),
      'xPrikey': xPrikey
    });
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultInt> BTCCreateContext(
      ContextCfgBTC config, int deviceID) async {
    Uint8List result = await _channel.invokeMethod(
        'BTCCreateContext', <String, dynamic>{
      'config': config.writeToBuffer(),
      'deviceID': deviceID
    });
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultString> BTCGetMainHDNode(int contextID) async {
    Uint8List result =
        await _channel.invokeMethod('BTCGetMainHDNode', contextID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCGetHDNode(
      int contextID, Bip32Path bip32Path) async {
    Uint8List result = await _channel.invokeMethod(
        'BTCGetHDNode', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip32Path.writeToBuffer()
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCGetAddress(
      int contextID, Bip32Path bip32Path, bool isShow) async {
    Uint8List result = await _channel.invokeMethod(
        'BTCGetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip32Path.writeToBuffer(),
      'isShow': isShow
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSetAddress(
      int contextID, Bip32Path bip32Path) async {
    Uint8List result =
        await _channel.invokeMethod('BTCSetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip32Path.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSignTransaction(
      int contextID, TransactionBTC txInfo) async {
    Uint8List result =
        await _channel.invokeMethod('BTCSignTransaction', <String, dynamic>{
      'contextID': contextID,
      'txInfo': txInfo.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSetUint(
      int contextID, BTC_UNIT_TYPE uintType) async {
    Uint8List result =
        await _channel.invokeMethod('BTCSetUint', <String, dynamic>{
      'contextID': contextID,
      'uintType': uintType.value,
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCBuildUSDTOutput(
      int contextID, String usdtTo, int amount) async {
    Uint8List result = await _channel.invokeMethod(
        'BTCBuildUSDTOutput', <String, dynamic>{
      'contextID': contextID,
      'usdtTo': usdtTo,
      'amount': amount
    });
    return ResultString.fromBuffer(result);
  }

  /// ETH

  static Future<ResultInt> ETHCreateContext_Software(
      ContextCfgETH config, String xPrikey) async {
    Uint8List result = await _channel.invokeMethod(
        'ETHCreateContext_Software', <String, dynamic>{
      'config': config.writeToBuffer(),
      'xPrikey': xPrikey
    });
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultInt> ETHCreateContext(
      ContextCfgETH config, int deviceID) async {
    Uint8List result = await _channel.invokeMethod(
        'ETHCreateContext', <String, dynamic>{
      'config': config.writeToBuffer(),
      'deviceID': deviceID
    });
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultString> ETHGetMainHDNode(
      int contextID, ENUM_PUB_FORMAT format) async {
    Uint8List result = await _channel.invokeMethod('ETHGetMainHDNode',
        <String, dynamic>{'contextID': contextID, 'format': format.value});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHGetHDNode(
      int contextID, ENUM_PUB_FORMAT format, Bip32Path bip32Path) async {
    Uint8List result =
        await _channel.invokeMethod('ETHGetHDNode', <String, dynamic>{
      'contextID': contextID,
      'format': format.value,
      'bip32Path': bip32Path.writeToBuffer()
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHGetAddress(
      int contextID, Bip32Path bip32Path, bool isShow) async {
    Uint8List result = await _channel.invokeMethod(
        'ETHGetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip32Path.writeToBuffer(),
      'isShow': isShow
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHSetAddress(
      int contextID, Bip32Path bip32Path) async {
    Uint8List result =
        await _channel.invokeMethod('ETHSetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip32Path.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHSignTransaction(
      int contextID, TransactionETH txInfo) async {
    Uint8List result =
        await _channel.invokeMethod('ETHSignTransaction', <String, dynamic>{
      'contextID': contextID,
      'txInfo': txInfo.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHBuildERC20Abi(
      int contextID, String address, String amountInWei) async {
    Uint8List result = await _channel.invokeMethod(
        'ETHBuildERC20Abi', <String, dynamic>{
      'contextID': contextID,
      'address': address,
      'amountInWei': amountInWei
    });
    return ResultString.fromBuffer(result);
  }
}
