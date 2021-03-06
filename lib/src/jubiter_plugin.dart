part of jubiter_plugin;

class JuBiterPlugin {
  static const String TAG = 'JuBiterPlugin';

  static const String NAMESPACE = 'com.jubiter.plugin';
  static const String METHOD_CHANNEL = NAMESPACE + '/methods';
  static const String SCAN_RESULT_CHANNEL = NAMESPACE + '/scanResult';
  static const String BLE_STATE_CHANNEL = NAMESPACE + '/state';
  static const String CONNECT_STATE_CHANNEL = NAMESPACE + '/connectState';

  static const MethodChannel _methodChannel = const MethodChannel(METHOD_CHANNEL);

//  static const EventChannel _connectStateChannel = const EventChannel(BLE_STATE_CHANNEL);
  static const EventChannel _scanResultChannel = const EventChannel(SCAN_RESULT_CHANNEL);
  static const EventChannel _connectStateChannel = const EventChannel(CONNECT_STATE_CHANNEL);

  // 广播流，允许被多次订阅
  static final StreamController<MethodCall> _methodStreamController =
      new StreamController.broadcast();

  static Stream<MethodCall> get _methodStream => _methodStreamController.stream;

  static Function _scanCallback;
  static Function _stopScanCallback;

  static Future<String> get platformVersion async {
    final String version = await _methodChannel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<ResultString> generateMnemonic(ENUM_MNEMONIC_STRENGTH strength) async {
    Uint8List result = await _methodChannel.invokeMethod('generateMnemonic', strength.value);
    return ResultString.fromBuffer(result);
  }

  static Future<int> checkMnemonic(String mnemonic) async {
    return await _methodChannel.invokeMethod('checkMnemonic', mnemonic);
  }

  static Future<ResultString> generateSeed(String mnemonic, String passphrase) async {
    Uint8List result = await _methodChannel.invokeMethod(
        'generateSeed', <String, String>{'mnemonic': mnemonic, 'passphrase': passphrase});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> seedToMasterPrivateKey(String seed, CURVES curves) async {
    Uint8List result = await _methodChannel.invokeMethod(
        'seedToMasterPrivateKey', <String, dynamic>{'seed': seed, 'curves': curves.value});
    return ResultString.fromBuffer(result);
  }

  // DEVICE

  static Future<ResultAny> getDeviceInfo(int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('getDeviceInfo', deviceID);
    return ResultAny.fromBuffer(result);
  }

  static Future<ResultString> getDeviceCert(int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('getDeviceCert', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> sendApdu(int deviceID, String apdu) async {
    Uint8List result = await _methodChannel
        .invokeMethod('sendApdu', <String, dynamic>{'deviceID': deviceID, 'apdu': apdu});
    return ResultString.fromBuffer(result);
  }

  static Future<bool> isInitialize(int deviceID) async {
    return await _methodChannel.invokeMethod('isInitialize', deviceID);
  }

  static Future<bool> isBootLoader(int deviceID) async {
    return await _methodChannel.invokeMethod('isBootLoader', deviceID);
  }

  static Future<ResultInt> setTimeout(int contextID, int timeout) async {
    return await _methodChannel
        .invokeMethod('setTimeout', <String, dynamic>{'contextID': contextID, 'timeout': timeout});
  }

  static Future<ResultString> enumApplets(int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('enumApplets', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> enumSupportCoins(int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('enumSupportCoins', deviceID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> getAppletVersion(int deviceID, String appletID) async {
    Uint8List result = await _methodChannel.invokeMethod(
        'getAppletVersion', <String, dynamic>{'deviceID': deviceID, 'appletID': appletID});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultInt> queryBattery(int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('queryBattery', deviceID);
    return ResultInt.fromBuffer(result);
  }

  static Future<int> clearContext(int contextID) async {
    return await _methodChannel.invokeMethod('clearContext', contextID);
  }

  static Future<int> showVirtualPWD(int contextID) async {
    return await _methodChannel.invokeMethod('showVirtualPWD', contextID);
  }

  static Future<int> cancelVirtualPWD(int contextID) async {
    return await _methodChannel.invokeMethod('cancelVirtualPWD', contextID);
  }

  static Future<ResultInt> verifyPIN(int contextID, String PIN) async {
    Uint8List result = await _methodChannel
        .invokeMethod('verifyPIN', <String, dynamic>{'contextID': contextID, 'PIN': PIN});
    return ResultInt.fromBuffer(result);
  }

  // BLE
  static Future<int> initDevice() async {
    // 初始化蓝牙相关的回调
    initEventChannel();
    try {
      return _methodChannel.invokeMethod('initDevice');
    } on PlatformException catch (e) {
      return int.parse(e.code);
    } catch (e) {
      return e;
    }
  }

  static void initEventChannel() {
    _methodChannel.setMethodCallHandler((MethodCall call) async {
      _methodStreamController.add(call);
    });
  }

  // scan BLE device, return result by stream
  static Stream<ScanResult> startScan(Duration timeout) async* {
    StreamSubscription subscription;
    StreamController controller;
    controller = new StreamController(
      onListen: () {
        LogUtils.d('$TAG >>> onListen');
        if (null != timeout) {
          Future.delayed(timeout, () => controller.close());
        }
      },
      onCancel: () {
        LogUtils.d('$TAG >>> start onCancel');
        stopScan();
        subscription.cancel();
      },
    );

    Stream stream = _scanResultChannel.receiveBroadcastStream();
    subscription =
        stream.listen(controller.add, onError: controller.addError, onDone: controller.close);

    await _methodChannel.invokeMethod('startScan');

    yield* controller.stream.map((buffer) => new ScanResult.fromBuffer(buffer));
  }

  static Future<int> stopScan() async {
    return await _methodChannel.invokeMethod('stopScan');
  }

  static Future<int> connect(BluetoothDevice device, Duration timeout,
      void onConnectStateChange(DeviceStateResponse state), void onError(Object error)) async {
    var request = ConnectRequest.create();
    request.remoteId = device.remoteId;
    request.timeout = timeout.inSeconds;

    StreamSubscription streamSubscription;
    streamSubscription = onStateChanged().listen((data) {
      LogUtils.d('$TAG >>> connect stream listen');
      if(data.state == DeviceStateResponse_BluetoothDeviceState.DISCONNECTED) {
        streamSubscription.cancel();
      }
      onConnectStateChange(data);
    }, onError: (Object event) {
      LogUtils.d('$TAG >>> connect onError');
      streamSubscription.cancel();
    }, onDone: () {
      LogUtils.d('$TAG >>> connect onDone');
      streamSubscription.cancel();
    });

    try {
      return await _methodChannel.invokeMethod('connectDeviceAsync', request.writeToBuffer());
    } catch (e) {
      LogUtils.d('$TAG >>> connect onError: $e');
      streamSubscription.cancel();
      return 123;
    }
  }

  /// Notifies when the device connection state has changed
  static Stream<DeviceStateResponse> onStateChanged() {
    return _methodStream
        .where((m) => m.method == "DeviceState")
        .map((m) => m.arguments)
        .map((buffer) => new DeviceStateResponse.fromBuffer(buffer));
//        .map((p) => BluetoothDeviceState.values[p.state.value]);
  }

  static Future<int> cancelConnect(String macAddress) async {
    return await _methodChannel.invokeMethod('cancelConnect', macAddress);
  }

  static Future<int> disconnectDevice(int deviceID) async {
    return await _methodChannel.invokeMethod('disconnectDevice', deviceID);
  }

  static Future<bool> isConnected(int deviceID) async {
    return await _methodChannel.invokeMethod('isConnected', deviceID);
  }

  /// BTC
  static Future<ResultInt> BTCCreateContext_Software(ContextCfgBTC config, String xPrikey) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCCreateContext_Software',
        <String, dynamic>{'config': config.writeToBuffer(), 'xPrikey': xPrikey});
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultInt> BTCCreateContext(ContextCfgBTC config, int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCCreateContext',
        <String, dynamic>{'config': config.writeToBuffer(), 'deviceID': deviceID});
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultString> BTCGetMainHDNode(int contextID) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCGetMainHDNode', contextID);
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCGetHDNode(int contextID, Bip44Path bip44Path) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCGetHDNode',
        <String, dynamic>{'contextID': contextID, 'bip32Path': bip44Path.writeToBuffer()});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCGetAddress(int contextID, Bip44Path bip44Path, bool isShow) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCGetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip44Path.writeToBuffer(),
      'isShow': isShow
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSetAddress(int contextID, Bip44Path bip44Path) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCSetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip44Path.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSignTransaction(int contextID, TransactionBTC txInfo) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCSignTransaction', <String, dynamic>{
      'contextID': contextID,
      'txInfo': txInfo.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCSetUint(int contextID, BTC_UNIT_TYPE uintType) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCSetUint', <String, dynamic>{
      'contextID': contextID,
      'uintType': uintType.value,
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> BTCBuildUSDTOutput(int contextID, String usdtTo, int amount) async {
    Uint8List result = await _methodChannel.invokeMethod('BTCBuildUSDTOutput',
        <String, dynamic>{'contextID': contextID, 'usdtTo': usdtTo, 'amount': amount});
    return ResultString.fromBuffer(result);
  }

  /// ETH

  static Future<ResultInt> ETHCreateContext_Software(ContextCfgETH config, String xPrikey) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHCreateContext_Software',
        <String, dynamic>{'config': config.writeToBuffer(), 'xPrikey': xPrikey});
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultInt> ETHCreateContext(ContextCfgETH config, int deviceID) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHCreateContext',
        <String, dynamic>{'config': config.writeToBuffer(), 'deviceID': deviceID});
    return ResultInt.fromBuffer(result);
  }

  static Future<ResultString> ETHGetMainHDNode(int contextID, ENUM_PUB_FORMAT format) async {
    Uint8List result = await _methodChannel.invokeMethod(
        'ETHGetMainHDNode', <String, dynamic>{'contextID': contextID, 'format': format.value});
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHGetHDNode(
      int contextID, ENUM_PUB_FORMAT format, Bip44Path bip44Path) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHGetHDNode', <String, dynamic>{
      'contextID': contextID,
      'format': format.value,
      'bip32Path': bip44Path.writeToBuffer()
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHGetAddress(int contextID, Bip44Path bip44Path, bool isShow) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHGetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip44Path.writeToBuffer(),
      'isShow': isShow
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHSetAddress(int contextID, Bip44Path bip44Path) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHSetAddress', <String, dynamic>{
      'contextID': contextID,
      'bip32Path': bip44Path.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHSignTransaction(int contextID, TransactionETH txInfo) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHSignTransaction', <String, dynamic>{
      'contextID': contextID,
      'txInfo': txInfo.writeToBuffer(),
    });
    return ResultString.fromBuffer(result);
  }

  static Future<ResultString> ETHBuildERC20Abi(int contextID, String tokenName, int uintDP,
      String contractAddress, String address, String amountInWei) async {
    Uint8List result = await _methodChannel.invokeMethod('ETHBuildERC20Abi', <String, dynamic>{
      'contextID': contextID,
      'tokenName': tokenName,
      'uintDP': uintDP,
      'contractAddress': contractAddress,
      'address': address,
      'amountInWei': amountInWei,
    });
    return ResultString.fromBuffer(result);
  }
}
