import 'package:flutter/foundation.dart';

class Logger {
  static debugLog(Object? printable) {
    if (kDebugMode) {
      print(printable);
    }
  }
}
