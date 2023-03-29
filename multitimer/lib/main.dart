import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Color c = Colors.black45;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: data.themeChanger,
        builder: (_, mode, __) {
          var textThemeFonts = TextTheme(
            bodyLarge: TextStyle(fontSize: 48.0),
            bodyMedium: TextStyle(fontSize: 28.0),
            bodySmall: TextStyle(fontSize: 18.0),
            labelSmall: TextStyle(fontSize: 8.0),
          );
          return MaterialApp(
            title: "MituTimer",
            themeMode: mode,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    centerTitle: true, titleTextStyle: TextStyle(fontSize: 42)),
                textTheme: textThemeFonts,
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.blueGrey,
                colorScheme: new ColorScheme(
                    brightness: Brightness.light,
                    primary: Colors.green,
                    onPrimary: c,
                    secondary: Colors.cyan,
                    onSecondary: c,
                    error: Colors.red,
                    onError: c,
                    background: Colors.blueGrey,
                    onBackground: c,
                    surface: Colors.white,
                    onSurface: c)),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                    centerTitle: true,
                    titleTextStyle: TextStyle(fontSize: 42),
                    backgroundColor: Colors.grey),
                textTheme: textThemeFonts,
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.grey[850],
                colorScheme: new ColorScheme(
                    brightness: Brightness.dark, /////////////////////??????????
                    primary: Colors.purple,
                    onPrimary: c,
                    secondary: Colors.indigo,
                    onSecondary: c,
                    error: Colors.red,
                    onError: c,
                    background: Colors.blue,
                    onBackground: c,
                    surface: c,
                    onSurface: Colors.grey)),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: SplashScreen(data),
          );
        });
  }
}
