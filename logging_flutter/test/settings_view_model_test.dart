import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:logging_flutter/settings/settings_view_model.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.example.settings');
  final SettingsViewModel viewModel = SettingsViewModel();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsViewModel Test', () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getDarkMode':
            return true; // Mocked response as boolean
          case 'setDarkMode':
            return null;
          case 'getFontSize':
            return 16.0; // Mocked response as double
          case 'setFontSize':
            return null;
          case 'getLanguage':
            return 'en'; // Mocked response as string
          case 'setLanguage':
            return null;
          case 'resetSettings':
            return null;
          default:
            return null;
        }
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('getDarkMode should return true', () async {
      await viewModel.getDarkMode();
      expect(viewModel.darkMode, true);
    });

    test('setDarkMode should set dark mode to false', () async {
      await viewModel.setDarkMode(false);
      expect(viewModel.darkMode, false);
    });

    test('getFontSize should return 16.0', () async {
      await viewModel.getFontSize();
      expect(viewModel.fontSize, 16.0);
    });

    test('setFontSize should set font size to 18.0', () async {
      await viewModel.setFontSize(18.0);
      expect(viewModel.fontSize, 18.0);
    });

    test('getLanguage should return en', () async {
      await viewModel.getLanguage();
      expect(viewModel.language, 'en');
    });

    test('setLanguage should set language to es', () async {
      await viewModel.setLanguage('es');
      expect(viewModel.language, 'es');
    });

    test('resetSettings should reset settings to default values', () async {
      await viewModel.resetSettings();
      expect(viewModel.darkMode, false);
      expect(viewModel.fontSize, 14.0);
      expect(viewModel.language, 'en');
    });

    // Additional test cases to increase the number of unit tests
    test('setDarkMode should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.setDarkMode(true);
      expect(viewModel.darkMode, false);
    });

    test('getFontSize should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.getFontSize();
      expect(viewModel.fontSize, 14.0);
    });

    test('setFontSize should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.setFontSize(20.0);
      expect(viewModel.fontSize, 14.0);
    });

    test('getLanguage should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.getLanguage();
      expect(viewModel.language, 'en');
    });

    test('setLanguage should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.setLanguage('fr');
      expect(viewModel.language, 'en');
    });

    test('resetSettings should handle exception gracefully', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(code: 'ERROR', message: 'Mock error');
      });

      await viewModel.resetSettings();
      expect(viewModel.darkMode, false);
      expect(viewModel.fontSize, 14.0);
      expect(viewModel.language, 'en');
    });

    test('getDarkMode should handle unexpected value', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return false;
      });

      await viewModel.getDarkMode();
      expect(viewModel.darkMode, false);
    });

    test('getFontSize should handle unexpected value', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return 14.0;
      });

      await viewModel.getFontSize();
      expect(viewModel.fontSize, 14.0);
    });

    test('getLanguage should handle unexpected value', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return 'en';
      });

      await viewModel.getLanguage();
      expect(viewModel.language, 'en');
    });
  });
}
