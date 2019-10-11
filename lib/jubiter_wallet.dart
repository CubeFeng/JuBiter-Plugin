part of jubiter_plugin;

///
/// Common Operation and Bluetooth Operation
///
class JuBiterWallet {

  static Future<ResultString> generateMnemonic(ENUM_MNEMONIC_STRENGTH strength) {
    return JuBiterPlugin.generateMnemonic(strength);
  }

  static Future<int> checkMnemonic(String mnemonic) {
    return JuBiterPlugin.checkMnemonic(mnemonic);
  }

  static Future<ResultString> generateSeed(String mnemonic, String passphrase) {
    return JuBiterPlugin.generateSeed(mnemonic, passphrase);
  }

  static Future<ResultString> seedToMasterPrivateKey(String seed, CURVES curves) {
    return JuBiterPlugin.seedToMasterPrivateKey(seed, curves);
  }

}