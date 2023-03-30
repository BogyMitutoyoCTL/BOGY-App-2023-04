import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'SubWidgets/ExpiredTimer.dart';
import 'data/Data.dart';
import 'data/ExpiredTimerData.dart';

class ExpiredTimers extends StatefulWidget {
  Data data;

  ExpiredTimers(this.data, {Key? key}) : super(key: key);

  @override
  State<ExpiredTimers> createState() => _ExpiredTimersState();
}

class _ExpiredTimersState extends State<ExpiredTimers> {
  @override
  Widget build(BuildContext context) {
    var timerlist = widget.data.getActiveTimers();
    List<Widget> widgetlist = [];
    for (var j = 0; j < timerlist.length; j++) {
      var expireddata = ExpiredTimerData();
      expireddata.timer = timerlist[j];
      var widget = ExpiredTimer(expireddata);
      widgetlist.add(widget);
    }
    return Scaffold(
        appBar: new AppBar(
            title: new Text(AppLocalizations.of(context)!.extimer,
                style: Theme.of(context).textTheme.titleLarge)),
        body: Row(
          children: [
            new ElevatedButton(
              onPressed: onTouched,
              child: Icon(Icons.arrow_back_outlined),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
            Expanded(
              child: ListView(
                  primary: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(children: widgetlist),
                  ]),
            ),
          ],
        ));
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context).pop();
  }
}
