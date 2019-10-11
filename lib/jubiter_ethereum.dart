part of jubiter_plugin;

class JuBiterEthereum {

  static Future<ResultInt> c(
      ContextCfgETH config, String xPrikey) async {
    return JuBiterPlugin.ETHCreateContext_Software(config, xPrikey);
  }

  static Future<ResultInt> ETHCreateContext(
      ContextCfgETH config, int deviceID) async {
    return JuBiterPlugin.ETHCreateContext(config, deviceID);
  }

  static Future<ResultString> ETHGetMainHDNode(
      int deviceID, ENUM_PUB_FORMAT format) async {
    return JuBiterPlugin.ETHGetMainHDNode(deviceID, format);
  }

  static Future<ResultString> ETHGetHDNode(
      int deviceID, ENUM_PUB_FORMAT format, Bip32Path bip32Path) async {
    return JuBiterPlugin.ETHGetHDNode(deviceID, format, bip32Path);
  }

  static Future<ResultString> ETHGetAddress(
      int contextID, Bip32Path bip32Path, bool isShow) async {
    return JuBiterPlugin.ETHGetAddress(contextID, bip32Path, isShow);
  }

  static Future<ResultString> ETHSetAddress(
      int contextID, Bip32Path bip32Path) async {
    return JuBiterPlugin.ETHSetAddress(contextID, bip32Path);
  }

  static Future<ResultString> ETHSignTransaction(
      int contextID, TransactionETH txInfo) async {
    return JuBiterPlugin.ETHSignTransaction(contextID, txInfo);
  }

  static Future<ResultString> ETHBuildERC20Abi(
      int contextID, String address, String amountInWei) async {
    return JuBiterPlugin.ETHBuildERC20Abi(contextID, address, amountInWei);
  }
}