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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: data.themeChanger,
        builder: (_, mode, __) {
          return MaterialApp(
            title: "MituTimer",
            themeMode: mode,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    centerTitle: true, titleTextStyle: TextStyle(fontSize: 36)),
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
                    primary: Colors.red,
                    onPrimary: Colors.black87,
                    secondary: Colors.cyan,
                    onSecondary: Colors.black87,
                    error: Colors.red,
                    onError: Colors.black87,
                    background: Colors.blueGrey,
                    onBackground: Colors.black87,
                    surface: Colors.white,
                    onSurface: Colors.black87)),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: TextStyle(fontSize: 42),
                  //backgroundColor: Colors.white
                ),
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.black87,
                colorScheme: new ColorScheme(
                    brightness: Brightness.dark,
                    primary: Colors.purple,
                    onPrimary: Colors.black87,
                    secondary: Colors.indigo,
                    onSecondary: Colors.black87,
                    error: Colors.red,
                    onError: Colors.black87,
                    background: Colors.blueGrey,
                    onBackground: Colors.black87,
                    surface: Colors.black87,
                    onSurface: Colors.white)),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: SplashScreen(data),
          );
        });
  }
}
