import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';
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
  if (!kIsWeb) {
    await Permission.notification.isDenied.then((value) {
      debugPrint("Do we have permissions to send out a notification?");
      if (value) {
        debugPrint("No we don't, lets request...");
        Permission.notification.request();
      } else {
        debugPrint("Yes we have. Lets send out some notifications. :-D");
      }
    });
  }
  await Permission.notification.isDenied.then((value) {
    debugPrint("Do we have permissions to send out a notification?");
    if (value) {
      debugPrint("No we don't, lets request...");
      Permission.notification.request();
    } else {
      debugPrint("Yes we have. Lets send out some notifications. :-D");
    }
  });
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
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 42),
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
                        labelSmall: TextStyle(fontSize: 16.0, color: black),
                      ),
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
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          titleTextStyle: TextStyle(fontSize: 42),
                          backgroundColor: appbarColor),
                      textTheme: TextTheme(
                        titleLarge: TextStyle(
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.w300),
                        titleMedium: TextStyle(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w500),
                        bodyLarge: TextStyle(fontSize: 38.0, color: white),
                        bodyMedium: TextStyle(fontSize: 24.0, color: white),
                        bodySmall: TextStyle(fontSize: 20.0, color: white),
                        labelSmall: TextStyle(fontSize: 16.0, color: white),
                      ),
                      primarySwatch: Colors.blue,
                      scaffoldBackgroundColor: Colors.grey[850],
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
