import 'package:flutter/material.dart';
import 'package:logging_flutter/about_page.dart';
import 'package:logging_flutter/category/category_page.dart';
import 'package:logging_flutter/category/category_view_model.dart';
import 'package:logging_flutter/home_page.dart';
import 'package:logging_flutter/settings/settings_page.dart';
import 'package:logging_flutter/settings/settings_view_model.dart';
import 'package:logging_flutter/task/task_page.dart';
import 'package:logging_flutter/task/task_view_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsViewModel()..getDarkMode()),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, settingsViewModel, child) {
          return MaterialApp(
            title: 'Task Manager Flutter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: settingsViewModel.darkMode ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
            routes: {
              '/tasks': (context) => TaskPage(),
              '/categories': (context) => CategoryPage(),
              '/settings': (context) => SettingsPage(),
              '/about': (context) => AboutPage(),
            },
          );
        },
      ),
    );
  }
}