import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/logger.dart';
import 'package:logging_flutter/main_viewmodel.dart';

void main() {
  late Logger logger;
  late MainViewModel viewModel;

  setUp(() {
    logger = Logger();
    viewModel = MainViewModel(logger);
  });

  group('Logger', () {
    test('logVerbose returns correct log message', () {
      String result = logger.logVerbose('This is a verbose message');
      expect(result, 'Verbose Log: This is a verbose message');
    });

    test('logTrace returns correct log message', () {
      String result = logger.logTrace('This is a trace message');
      expect(result, 'Trace Log: This is a trace message');
    });

    test('logSevere returns correct log message', () {
      String result = logger.logSevere('This is a severe message');
      expect(result, 'Severe Log: This is a severe message');
    });

    test('logData adds correct log messages to logsList', () {
      String className = "TestClassName";
      viewModel.logData(className);

      expect(viewModel.logsList.length, 3);
      expect(viewModel.logsList[0], 'Verbose Log: $className');
      expect(viewModel.logsList[1], 'Trace Log: $className');
      expect(viewModel.logsList[2], 'Severe Log: $className');

      viewModel.logsList.clear();
    });

  });
}
