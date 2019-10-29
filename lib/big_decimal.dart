part of jubiter_plugin;

///
/// 大数转换工具
///
class BigDecimal {

  static Future<String> bigNumberMultiply(String value, int position) {
    return JuBiterPlugin.bigNumberMultiply(value, position);
  }

  static Future<String> bigNumberDivide(String value, int position) {
    return JuBiterPlugin.bigNumberDivide(value, position);
  }
}