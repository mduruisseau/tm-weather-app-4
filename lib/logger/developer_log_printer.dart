import 'dart:developer' as dev;

import 'package:logger/logger.dart';

class DeveloperLogPrinter extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(dev.log);
  }
}
