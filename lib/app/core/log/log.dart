import 'package:logger/logger.dart';

class Log {
  Log._();

  static info(String message) => Logger().i(message);
  static debug(String message) => Logger().d(message);
  static error(String message) => Logger().e(message);
  static verbose(String message) => Logger().v(message);
  static warning(String message) => Logger().w(message);
  static wtf(String message) => Logger().wtf(message);
}
