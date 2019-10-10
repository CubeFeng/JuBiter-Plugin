part of jubiter_plugin;

///
/// 日志库
/// 目前只支持 Android
///
class LogUtils {

  static Logger _logger = new Logger(
    printer: PrettyPrinter(),
  );


  static void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}