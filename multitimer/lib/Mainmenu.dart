import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ActiveTimers.dart';
import 'package:multitimer/Categories.dart';
import 'package:multitimer/CreateTimer.dart';
import 'package:multitimer/Settings.dart';
import 'package:multitimer/data/Data.dart';

class Mainmenu extends StatefulWidget {
  Data data;

  Mainmenu(this.data, {Key? key}) : super(key: key);

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  _MainmenuState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(AppLocalizations.of(context)!.mainmenu),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(
                AppLocalizations.of(context)!.appname,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Expanded(
                  child: new Container(width: double.infinity, height: 50)),
              new Image.asset(
                'assets/images/Hourglass.png',
                width: 200,
                height: 150,
              ),
              Expanded(
                  child: new Container(width: double.infinity, height: 50)),
              Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Neuer Timer
                  onPressed: onCreate,
                  icon: Icon(
                    Icons.format_list_bulleted_add,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.newtimer),
                ),
              ),
              Expanded(
                  child: new Container(width: double.infinity, height: 50)),
              Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Meine Timer
                  onPressed: onCategories,
                  icon: Icon(
                    Icons.format_list_bulleted,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.mytimer),
                ),
              ),
              Expanded(
                  child: new Container(width: double.infinity, height: 50)),
              Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Aktive Timer
                  onPressed: onActive,
                  icon: Icon(
                    Icons.hourglass_bottom,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.aktimer +
                      "/" +
                      AppLocalizations.of(context)!.extimer),
                ),
              ),
              Expanded(
                  child: new Container(width: double.infinity, height: 50)),
              Container(
                width: 300,
                height: 43,
                child: ElevatedButton.icon(
                  //Einstellungen
                  onPressed: onSettings,
                  icon: Icon(
                    Icons.settings,
                    size: 24.0,
                  ),
                  label: Text(AppLocalizations.of(context)!.settings),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCreate() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateTimer(widget.data))); //Neuer Timer
  }

  void onCategories() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Categories(widget.data))); //Meine Timer
  }

  void onActive() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ActiveTimers(widget.data))); //Aktive Timer
  }

  void onSettings() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Settings(widget.data))); //Einstellungen
  }
}
