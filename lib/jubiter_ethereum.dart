part of jubiter_plugin;

class JuBiterEthereum {

  static Future<ResultInt> createContext_Software(
      ContextCfgETH config, String xPrikey) async {
    return JuBiterPlugin.ETHCreateContext_Software(config, xPrikey);
  }

  static Future<ResultInt> createContext(
      ContextCfgETH config, int deviceID) async {
    return JuBiterPlugin.ETHCreateContext(config, deviceID);
  }

  static Future<ResultString> getMainHDNode(
      int contextID, ENUM_PUB_FORMAT format) async {
    return JuBiterPlugin.ETHGetMainHDNode(contextID, format);
  }

  static Future<ResultString> getHDNode(
      int contextID, ENUM_PUB_FORMAT format, Bip32Path bip32Path) async {
    return JuBiterPlugin.ETHGetHDNode(contextID, format, bip32Path);
  }

  static Future<ResultString> getAddress(
      int contextID, Bip32Path bip32Path, bool isShow) async {
    return JuBiterPlugin.ETHGetAddress(contextID, bip32Path, isShow);
  }

  static Future<ResultString>setAddress(
      int contextID, Bip32Path bip32Path) async {
    return JuBiterPlugin.ETHSetAddress(contextID, bip32Path);
  }

  static Future<ResultString> signTransaction(
      int contextID, TransactionETH txInfo) async {
    return JuBiterPlugin.ETHSignTransaction(contextID, txInfo);
  }

  static Future<ResultString> buildERC20Abi(
      int contextID, String address, String amountInWei) async {
    return JuBiterPlugin.ETHBuildERC20Abi(contextID, address, amountInWei);
  }
}