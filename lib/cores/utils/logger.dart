import 'dart:io';
import 'package:flutter/foundation.dart';

class LoggerHelper {
  static log(e, [StackTrace? s]) {
    // Don't log during tests or prod
    if (Platform.environment.containsKey('FLUTTER_TEST') && kReleaseMode) {
      return;
    }

    // dev.log(e.toString());
    // dev.log(s.toString());

    // _logger.d(e, stackTrace: s);

    // _newLogger.info("Logs", e);
    // _newLogger.info("Stack Trace:", s);
    //
    // if (s != null) _logger.d("", stackTrace: s);

    debugPrint(e.toString(), wrapWidth: 1024);
    debugPrint(s.toString(), wrapWidth: 1024);
  }
}
