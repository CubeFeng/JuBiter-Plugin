part of jubiter_plugin;

class JuBiterWallet {

  static Future<String> generateMnemonic(ENUM_MNEMONIC_STRENGTH strength) {
    return JuBiterPlugin.generateMnemonic(strength);
  }

}