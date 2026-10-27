import 'package:flutter/foundation.dart';

class Logger {
  static void log(String message) {
    // You can customize this to log to a file, console, or any logging service.
    if (kDebugMode) {
      // print(message);
      debugPrint(message);
    }
  }
}
