import 'package:logger/logger.dart';

class TLoggerHelper {
  // Hata ayıklama seviyesinde (debug) log yazan fonksiyon
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );
  static void debug(String message) {
    _logger.d(message);
  }

  // Bilgi seviyesinde log yazan fonksiyon
  static void info(String message) {
    _logger.i(message);
  }

  // Uyarı seviyesinde log yazan fonksiyon
  static void warning(String message) {
    _logger.w(message);
  }

  // Hata seviyesinde log yazan fonksiyon
  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}

/*
debug: Hata ayıklama seviyesinde log yazan fonksiyon. Bu fonksiyon, geliştirme sürecinde daha fazla detay içeren logları yazmak için kullanılır.
info: Bilgi seviyesinde log yazan fonksiyon. Genel bilgi mesajlarını loglamak için kullanılır.
warning: Uyarı seviyesinde log yazan fonksiyon. Uyarı mesajlarını loglamak için kullanılır.
error: Hata seviyesinde log yazan fonksiyon. Hata mesajları ve isteğe bağlı olarak hatayı içeren logları yazmak için kullanılır.
 */