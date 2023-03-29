import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Settings.dart';
import 'SplashScreen.dart';
import 'data/Data.dart';
import 'data/Storage.dart';

SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var storage = new Storage();
  Data data = await storage.load();
  print(jsonEncode(data));
  var myApp = MultiTimerApp(data);
  runApp(myApp);
}

class MultiTimerApp extends StatelessWidget {
  Data data;
  MultiTimerApp(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
        valueListenable: data.appBarColor,
        builder: (_, appbarColor, __) {
          return ValueListenableBuilder<ThemeMode>(
              valueListenable: data.themeChanger,
              builder: (_, mode, __) {
                return MaterialApp(
                  title: "MituTimer",
                  themeMode: mode,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 36)),
                      textTheme: TextTheme(
                        bodyLarge: TextStyle(fontSize: 48.0),
                        bodyMedium: TextStyle(fontSize: 28.0),
                        bodySmall: TextStyle(fontSize: 18.0),
                        labelSmall: TextStyle(fontSize: 8.0),
                      ),
                      primarySwatch: Colors.blue,
                      scaffoldBackgroundColor: Colors.blueGrey,
                      colorScheme: new ColorScheme(
                          brightness: Brightness.light,
                          primary: appbarColor,
                          onPrimary: Colors.black,
                          secondary: Colors.cyan,
                          onSecondary: Colors.black,
                          error: Colors.red,
                          onError: Colors.black,
                          background: Colors.blueGrey,
                          onBackground: Colors.black,
                          surface: Colors.white,
                          onSurface: Colors.black)),
                  darkTheme: ThemeData(
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 42),
                          backgroundColor: Colors.white),
                      primarySwatch: Colors.blue,
                      scaffoldBackgroundColor: Colors.white,
                      colorScheme: new ColorScheme(
                          brightness: Brightness.dark,
                          primary: appbarColor,
                          onPrimary: Colors.black,
                          secondary: Colors.indigo,
                          onSecondary: Colors.black,
                          error: Colors.red,
                          onError: Colors.black,
                          background: Colors.blueGrey,
                          onBackground: Colors.black,
                          surface: Colors.black,
                          onSurface: Colors.white)),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: SplashScreen(data),
                );
              });
        });
  }
}
