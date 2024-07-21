import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsViewModel extends ChangeNotifier {
  static const platform = MethodChannel('com.example.settings');
  bool _darkMode = false;
  double _fontSize = 14.0;
  String _language = 'en';

  bool get darkMode => _darkMode;
  double get fontSize => _fontSize;
  String get language => _language;

  Future<void> getDarkMode() async {
    try {
      final bool result = await platform.invokeMethod('getDarkMode');
      _darkMode = result;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to get dark mode: '${e.message}'.");
    }
  }

  Future<void> setDarkMode(bool value) async {
    try {
      await platform.invokeMethod('setDarkMode', value);
      _darkMode = value;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to set dark mode: '${e.message}'.");
    }
  }

  Future<void> getFontSize() async {
    try {
      final double result = await platform.invokeMethod('getFontSize');
      _fontSize = result;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to get font size: '${e.message}'.");
    }
  }

  Future<void> setFontSize(double value) async {
    try {
      await platform.invokeMethod('setFontSize', value);
      _fontSize = value;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to set font size: '${e.message}'.");
    }
  }

  Future<void> getLanguage() async {
    try {
      final String result = await platform.invokeMethod('getLanguage');
      _language = result;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to get language: '${e.message}'.");
    }
  }

  Future<void> setLanguage(String value) async {
    try {
      await platform.invokeMethod('setLanguage', value);
      _language = value;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to set language: '${e.message}'.");
    }
  }

  Future<void> resetSettings() async {
    try {
      await platform.invokeMethod('resetSettings');
      _darkMode = false;
      _fontSize = 14.0;
      _language = 'en';
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to reset settings: '${e.message}'.");
    }
  }
}
