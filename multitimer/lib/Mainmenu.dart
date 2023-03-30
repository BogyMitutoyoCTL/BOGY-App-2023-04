import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ActiveTimers.dart';
import 'package:multitimer/Categories.dart';
import 'package:multitimer/CreateTimer.dart';
import 'package:multitimer/Settings.dart';
import 'package:multitimer/data/Data.dart';
import 'package:multitimer/notification_service/local_notice_service.dart';

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
    var width = 300.0;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(AppLocalizations.of(context)!.mainmenu,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: ListView(primary: true, scrollDirection: Axis.vertical, children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: new Column(
              children: [
                new Text(
                  AppLocalizations.of(context)!.appname,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                new Container(width: width, height: 15),
                new Image.asset(
                  'assets/images/Hourglass.png',
                  width: 200,
                  height: 160,
                ),
                new Container(width: width, height: 50),
                Container(
                  width: width,
                  height: 43,
                  child: ElevatedButton.icon(
                    //Neuer Timer
                    onPressed: onCreate,
                    icon: Icon(
                      Icons.format_list_bulleted_add,
                      size: 24.0,
                    ),
                    label: Text(AppLocalizations.of(context)!.newtimer,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                new Container(width: width, height: 50),
                Container(
                  width: width,
                  height: 43,
                  child: ElevatedButton.icon(
                    //Meine Timer
                    onPressed: onCategories,
                    icon: Icon(
                      Icons.format_list_bulleted,
                      size: 24.0,
                    ),
                    label: Text(AppLocalizations.of(context)!.mytimer,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                new Container(width: width, height: 50),
                Container(
                  width: width,
                  height: 43,
                  child: ElevatedButton.icon(
                    //Aktive Timer
                    onPressed: onActive,
                    icon: Icon(
                      Icons.hourglass_bottom,
                      size: 24.0,
                    ),
                    label: Text(AppLocalizations.of(context)!.timerlistbutton,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                new Container(width: width, height: 50),
                Container(
                  width: width,
                  height: 43,
                  child: ElevatedButton.icon(
                    //Einstellungen
                    onPressed: onSettings,
                    icon: Icon(
                      Icons.settings,
                      size: 24.0,
                    ),
                    label: Text(AppLocalizations.of(context)!.settings,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                new Container(width: width, height: 50),
                Container(
                  width: width,
                  height: 43,
                  child: ElevatedButton.icon(
                    //Benachrichtigungen
                    onPressed: () {
                      LocalNotificationService().showSimpleNotification(
                        title: 'Sample notification',
                        body:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      );
                    },
                    icon: Icon(
                      Icons.notifications,
                      size: 24.0,
                    ),
                    label: Text(AppLocalizations.of(context)!.notification,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
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
