import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(AppLocalizations.of(context)!.mainmenu),
          backgroundColor: Colors.red),
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Text(
                "Mitutimer",
                textScaleFactor: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Image.asset(
                'assets/images/Hourglass.png',
                width: 200,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  onPressed: onClick,
                  icon: Icon(
                    Icons.format_list_bulleted_add,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.newtimer),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  onPressed: onTouch,
                  icon: Icon(
                    Icons.format_list_bulleted,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.mytimer),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  onPressed: onClick,
                  icon: Icon(
                    Icons.hourglass_bottom,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.aktimer),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  onPressed: onClick,
                  icon: Icon(
                    Icons.settings,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.settings),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onClick() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Mainmenu()));
  }

  void onTouch() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Mainmenu()));
  }

  void onPress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Mainmenu()));
  }

  void onActivate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Mainmenu()));
  }
}
