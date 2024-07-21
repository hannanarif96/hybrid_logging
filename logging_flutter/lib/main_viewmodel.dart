import 'package:logging_flutter/logger.dart';

class MainViewModel {
  final Logger logger;
  List<String> logsList = [];

  MainViewModel(this.logger);

  void logData(String className) {
    logsList.add(logger.logVerbose(className));
    logsList.add(logger.logTrace(className));
    logsList.add(logger.logSevere(className));
  }
}