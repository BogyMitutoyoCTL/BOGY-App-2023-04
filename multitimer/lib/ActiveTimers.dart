import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ExpiredTimers.dart';
import 'package:multitimer/data/Activetimersdata.dart';

import 'SubWidgets/ActiveTimer.dart';

class ActiveTimers extends StatefulWidget {
  var data;

  ActiveTimers(this.data, {Key? key}) : super(key: key);
  @override
  State<ActiveTimers> createState() => _ActiveTimersState();
}

class _ActiveTimersState extends State<ActiveTimers> {
  @override
  Widget build(BuildContext context) {
    List<Widget> timerlist = [];
    for (var i = 0; i <= 100; i++) {
      var widget = ActiveTimer(ActiveTimerdata());
      timerlist.add(widget);
    }

    return Scaffold(
        appBar:
            new AppBar(title: new Text(AppLocalizations.of(context)!.aktimer)),
        body: Row(
          children: [
            Expanded(
              child: ListView(
                  primary: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(children: timerlist),
                  ]),
            ),
            new ElevatedButton(
              onPressed: onTouched,
              child: Icon(Icons.arrow_forward_outlined),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ));
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ExpiredTimers()));
  }
}
