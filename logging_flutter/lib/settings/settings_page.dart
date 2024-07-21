import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Consumer<SettingsViewModel>(
          builder: (context, settingsViewModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode: ${settingsViewModel.darkMode ? "On" : "Off"}'),
                Switch(
                  value: settingsViewModel.darkMode,
                  onChanged: (value) async {
                    await settingsViewModel.setDarkMode(value);
                  },
                ),
                Text('Font Size: ${settingsViewModel.fontSize}'),
                Slider(
                  value: settingsViewModel.fontSize,
                  min: 10.0,
                  max: 30.0,
                  divisions: 20,
                  onChanged: (value) async {
                    await settingsViewModel.setFontSize(value);
                  },
                ),
                Text('Language: ${settingsViewModel.language}'),
                DropdownButton<String>(
                  value: settingsViewModel.language,
                  onChanged: (String? newValue) async {
                    await settingsViewModel.setLanguage(newValue ?? 'en');
                  },
                  items: <String>['en', 'es', 'fr', 'de']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await settingsViewModel.getDarkMode();
                    await settingsViewModel.getFontSize();
                    await settingsViewModel.getLanguage();
                  },
                  child: Text('Refresh Settings'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
