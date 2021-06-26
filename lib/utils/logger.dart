import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'dart:developer' as developer;

void initRootLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.INFO;
  } else {
    Logger.root.level = Level.WARNING;
  }
  hierarchicalLoggingEnabled = true;

  // Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) async {
    if (!kDebugMode) {
      // TODO: send crash to service
      // print(record.message);
      developer.log(record.message);
      return;
    }

    var start = '';
    const end = '';
    const white = '';

    switch (record.level.name) {
      case 'FINE':
        start = '';
        break;
      case 'INFO':
        start = '';
        break;
      case 'WARNING':
        start = '';
        break;
      case 'SEVERE':
        start = '';
        break;
      case 'SHOUT':
        start = '';
        break;
    }

    final message =
        '$white${record.time}:$end$start[${record.level.name}]: ${record.message}$end';
    developer.log(
      message,
      name: record.loggerName,
      level: record.level.value,
      time: record.time,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
}
