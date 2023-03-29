import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ActiveTimers.dart';
import 'package:multitimer/Settings.dart';
import 'package:multitimer/data/Data.dart';

class Mainmenu extends StatefulWidget {
  Data data;

  Mainmenu(Data this.data, {Key? key}) : super(key: key);

  @override
  State<Mainmenu> createState() => _MainmenuState(data);
}

class _MainmenuState extends State<Mainmenu> {
  Data data;

  _MainmenuState(Data this.data);

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
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Text(
                AppLocalizations.of(context)!.appname,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Image.asset(
                'assets/images/Hourglass.png',
                width: 200,
                height: 150,
              ),
            ),
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Neuer Timer
                  onPressed: onClick,
                  icon: Icon(
                    Icons.format_list_bulleted_add,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.newtimer),
                ),
              ),
            ),
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Meine Timer
                  onPressed: onTouch,
                  icon: Icon(
                    Icons.format_list_bulleted,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.mytimer),
                ),
              ),
            ),
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Aktive Timer
                  onPressed: onPress,
                  icon: Icon(
                    Icons.hourglass_bottom,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.aktimer),
                ),
              ),
            ),
            Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Einstellungen
                  onPressed: onActivate,
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
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Mainmenu(data))); //Neuer Timer
  }

  void onTouch() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Mainmenu(data))); //Meine Timer
  }

  void onPress() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ActiveTimers())); //Aktive Timer
  }

  void onActivate() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Settings(data))); //Einstellungen
  }
}
