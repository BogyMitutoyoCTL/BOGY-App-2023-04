import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'SubWidgets/ExpiredTimer.dart';
import 'data/ExpiredTimerData.dart';

class ExpiredTimers extends StatefulWidget {
  const ExpiredTimers({key}) : super(key: key);

  @override
  State<ExpiredTimers> createState() => _ExpiredTimersState();
}

class _ExpiredTimersState extends State<ExpiredTimers> {
  @override
  Widget build(BuildContext context) {
    List<Widget> timerlist = [];
    for (var j = 0; j <= 100; j++) {
      var widget = ExpiredTimer(ExpiredTimerData());
      timerlist.add(widget);
    }
    return Scaffold(
        appBar:
            new AppBar(title: new Text(AppLocalizations.of(context)!.extimer)),
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
                    Column(children: timerlist),
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
