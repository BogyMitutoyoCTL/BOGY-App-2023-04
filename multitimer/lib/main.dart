import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/Data.dart';
import 'data/Storage.dart';
import 'notification_service/local_notice_service.dart';

SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var storage = new Storage();
  Data data = await storage.load();
  debugPrint(jsonEncode(data));
  var myApp = MultiTimerApp(data);
  await LocalNotificationService().setup();
  runApp(myApp);
}

class MultiTimerApp extends StatelessWidget {
  Data data;

  MultiTimerApp(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
        valueListenable: data.appBarColorChanger,
        builder: (_, appbarColor, __) {
          return ValueListenableBuilder<ThemeMode>(
              valueListenable: data.themeChanger,
              builder: (_, mode, __) {
                var black = Colors.black;
                var white = Colors.white;
                return MaterialApp(
                  scrollBehavior: ScrollBehavior(),
                  title: "MituTimer",
                  themeMode: mode,
                  theme: ThemeData(
                      canvasColor: appbarColor,
                      //drop down list color
                      elevatedButtonTheme: ElevatedButtonThemeData(
                          style:
                              ElevatedButton.styleFrom(foregroundColor: black)),
                      iconTheme: IconThemeData(color: black),
                      iconButtonTheme: IconButtonThemeData(
                          style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(black),
                        backgroundColor: MaterialStatePropertyAll(white),
                      )),
                      appBarTheme: AppBarTheme(
                          iconTheme: IconThemeData(color: black),
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 42, color: black),
                          backgroundColor: appbarColor),
                      textTheme: TextTheme(
                          titleLarge: TextStyle(
                              fontSize: 36,
                              color: white,
                              fontWeight: FontWeight.w300),
                          titleMedium: TextStyle(
                              fontSize: 22,
                              color: black,
                              fontWeight: FontWeight.w500),
                          bodyLarge: TextStyle(fontSize: 38.0, color: black),
                          bodyMedium: TextStyle(fontSize: 24.0, color: black),
                          bodySmall: TextStyle(fontSize: 20.0, color: black),
                          labelSmall: TextStyle(fontSize: 18.0, color: black),
                          labelMedium: TextStyle(fontSize: 14.0, color: black)),
                      primarySwatch: Colors.blue,
                      scaffoldBackgroundColor: Colors.blueGrey,
                      colorScheme: new ColorScheme(
                          brightness: Brightness.light,
                          primary: appbarColor,
                          onPrimary: black,
                          secondary: Colors.cyan,
                          onSecondary: black,
                          error: Colors.red,
                          onError: black,
                          background: Colors.blueGrey,
                          onBackground: black,
                          surface: white,
                          onSurface: black)),
                  darkTheme: ThemeData(
                      //////////////////////////DARK THEME
                      canvasColor: appbarColor,
                      elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: white,
                              backgroundColor: appbarColor)),
                      inputDecorationTheme: InputDecorationTheme(
                          counterStyle: TextStyle(color: Colors.white)),
                      iconButtonTheme: IconButtonThemeData(
                          style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(white),
                        backgroundColor: MaterialStatePropertyAll(black),
                      )),
                      appBarTheme: AppBarTheme(
                          iconTheme: IconThemeData(color: white),
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 42, color: white),
                          backgroundColor: appbarColor),
                      textTheme: TextTheme(
                        titleLarge: TextStyle(
                            fontSize: 36,
                            color: white,
                            fontWeight: FontWeight.w300),
                        titleMedium: TextStyle(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w500),
                        bodyLarge: TextStyle(fontSize: 38.0, color: white),
                        bodyMedium: TextStyle(fontSize: 24.0, color: white),
                        bodySmall: TextStyle(fontSize: 20.0, color: white),
                        labelSmall: TextStyle(fontSize: 18.0, color: white),
                      ),
                      primarySwatch: Colors.blue,
                      scaffoldBackgroundColor: Colors.grey[850],
                      iconTheme: IconThemeData(color: white),
                      colorScheme: new ColorScheme(
                          brightness: Brightness.light,
                          primary: appbarColor,
                          onPrimary: black,
                          secondary: Colors.indigo,
                          onSecondary: black,
                          error: Colors.red,
                          onError: black,
                          background: white,
                          onBackground: white,
                          surface: black,
                          onSurface: white)),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: SplashScreen(data),
                );
              });
        });
  }
}
