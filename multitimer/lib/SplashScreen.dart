import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    // Timer timer = Timer(const Duration(seconds: 5), () {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => Mainmenu()));
    // });
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
                textScaleFactor: 3,
              ),
            ),
            new Image.asset("assets/images/Logo.png", width: 200),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: new Text("    Loading . . .", textScaleFactor: 2),
            ),
            new Expanded(child: new Container()),
            new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Image.asset(
                  "assets/images/LogoM.png",
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
