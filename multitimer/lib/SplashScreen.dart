import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/Data.dart';

import 'Mainmenu.dart';

class SplashScreen extends StatefulWidget {
  Data data;

  SplashScreen(Data this.data, {Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState(data);
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState(Data data) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Mainmenu(data)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Text(
                AppLocalizations.of(context)!.appname,
                textScaleFactor: 2.5,
                style: TextStyle(fontFamily: "Lobster"),
              ),
            ),
            new Image.asset("assets/images/logo.png", width: 200),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: new Text("    Loading . . .", textScaleFactor: 1),
            ),
            new Expanded(child: new Container()),
            new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Image.asset(
                  "assets/images/logo_m.png",
                  width: 100,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
