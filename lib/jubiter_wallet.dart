part of jubiter_plugin;

///
/// Common Operation and Bluetooth Operation
///
class JuBiterWallet {
  static Future<ResultString> generateMnemonic(
      ENUM_MNEMONIC_STRENGTH strength) {
    return JuBiterPlugin.generateMnemonic(strength);
  }

  static Future<int> checkMnemonic(String mnemonic) {
    return JuBiterPlugin.checkMnemonic(mnemonic);
  }

  static Future<ResultString> generateSeed(String mnemonic, String passphrase) {
    return JuBiterPlugin.generateSeed(mnemonic, passphrase);
  }

  static Future<ResultString> seedToMasterPrivateKey(
      String seed, CURVES curves) {
    return JuBiterPlugin.seedToMasterPrivateKey(seed, curves);
  }

  static Future<ResultAny> getDeviceInfo(int deviceID) async {
    return JuBiterPlugin.getDeviceInfo(deviceID);
  }

  static Future<ResultString> getDeviceCert(int deviceID) async {
    return JuBiterPlugin.getDeviceCert(deviceID);
  }

  static Future<ResultString> sendApdu(int deviceID, String apdu) async {
    return JuBiterPlugin.sendApdu(deviceID, apdu);
  }

  static Future<bool> isInitialize(int deviceID) async {
    return JuBiterPlugin.isInitialize(deviceID);
  }

  static Future<bool> isBootLoader(int deviceID) async {
    return JuBiterPlugin.isBootLoader(deviceID);
  }

  static Future<ResultInt> setTimeout(int contextID, int timeout) async {
    return JuBiterPlugin.setTimeout(contextID, timeout);
  }

  static Future<ResultString> enumApplets(int deviceID) async {
    return JuBiterPlugin.enumApplets(deviceID);
  }

  static Future<ResultString> enumSupportCoins(int deviceID) async {
    return JuBiterPlugin.enumSupportCoins(deviceID);
  }

  static Future<ResultString> getAppletVersion(
      int deviceID, String appletID) async {
    return JuBiterPlugin.getAppletVersion(deviceID, appletID);
  }

  static Future<ResultInt> queryBattery(int deviceID) async {
    return JuBiterPlugin.queryBattery(deviceID);
  }

  static Future<int> clearContext(int contextID) async {
    return JuBiterPlugin.clearContext(contextID);
  }

  static Future<int> showVirtualPWD(int contextID) async {
    return JuBiterPlugin.showVirtualPWD(contextID);
  }

  static Future<int> cancelVirtualPWD(int contextID) async {
    return JuBiterPlugin.cancelVirtualPWD(contextID);
  }

  static Future<ResultInt> verifyPIN(int contextID, String PIN) async {
    return JuBiterPlugin.verifyPIN(contextID, PIN);
  }

  static Future<int> initDevice() async {
    return JuBiterPlugin.initDevice();
  }

  static Stream<ScanResult> startScan(Duration timeout) async* {
    yield* JuBiterPlugin.startScan(timeout);
  }

  static Future<int> stopScan() async {
    return JuBiterPlugin.stopScan();
  }

  static Stream<BluetoothDeviceState> connectDeviceAsync(
      BluetoothDevice device, Duration timeout) async*  {
    yield* JuBiterPlugin.connectDeviceAsync(device, timeout);
  }

  static Future<int> connect(BluetoothDevice device, Duration timeout,
      void onConnectStateChange(BluetoothDeviceState state), void onError(Object error)) async {
    return JuBiterPlugin.connect(device, timeout, onConnectStateChange, onError);
  }

  static Future<int> cancelConnect(String macAddress) async {
    return JuBiterPlugin.cancelConnect(macAddress);
  }

  static Future<int> disconnectDevice(int deviceID) async {
    return JuBiterPlugin.disconnectDevice(deviceID);
  }

  static Future<bool> isConnected(int deviceID) async {
    return JuBiterPlugin.isConnected(deviceID);
  }
}

enum BluetoothDeviceState { disconnected, connecting, connected, disconnecting }
