part of jubiter_plugin;

class JuBiterBitcoin {

  static Future<ResultInt> createContext_Software(
      ContextCfgBTC config, String xPrikey) async {
    return JuBiterPlugin.BTCCreateContext_Software(config, xPrikey);
  }

  static Future<ResultInt> createContext(
      ContextCfgBTC config, int deviceID) async {
    return JuBiterPlugin.BTCCreateContext(config, deviceID);
  }

  static Future<ResultString> getMainHDNode(int contextID) async {
    return JuBiterPlugin.BTCGetMainHDNode(contextID);
  }

  static Future<ResultString> getHDNode(
      int contextID, Bip32Path bip32Path) async {
    return JuBiterPlugin.BTCGetHDNode(contextID, bip32Path);
  }

  static Future<ResultString> getAddress(
      int contextID, Bip32Path bip32Path, bool isShow) async {
    return JuBiterPlugin.BTCGetAddress(contextID, bip32Path, isShow);
  }

  static Future<ResultString> setAddress(
      int contextID, Bip32Path bip32Path) async {
    return JuBiterPlugin.BTCSetAddress(contextID, bip32Path);
  }

  static Future<ResultString> signTransaction(
      int contextID, TransactionBTC txInfo) async {
    return JuBiterPlugin.BTCSignTransaction(contextID, txInfo);
  }

  static Future<ResultString> setUint(
      int contextID, BTC_UNIT_TYPE uintType) async {
    return JuBiterPlugin.BTCSetUint(contextID, uintType);
  }

  static Future<ResultString> buildUSDTOutput(
      int contextID, String usdtTo, int amount) async {
    return JuBiterPlugin.BTCBuildUSDTOutput(contextID, usdtTo, amount);
  }

}