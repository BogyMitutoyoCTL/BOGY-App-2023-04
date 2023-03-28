import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'data/Storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';
import 'data/Data.dart';

import 'dart:convert';

Data data = new Data();
SharedPreferences? prefs;

Future<void> main() async {
  print(jsonEncode(data));

  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var storage = new Storage();
  data = await storage.load();
  var myApp = MultiTimerApp();
  runApp(myApp);
}

class MultiTimerApp extends StatelessWidget {
  const MultiTimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.blueGrey,
          colorScheme: new ColorScheme(
              brightness: Brightness.light,
              primary: Colors.red,
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: new ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.purple,
              onPrimary: Colors.black,
              secondary: Colors.indigo,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.black,
              background: Colors.blueGrey,
              onBackground: Colors.black,
              surface: Colors.black,
              onSurface: Colors.white)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SplashScreen(),
    );
  }
}
