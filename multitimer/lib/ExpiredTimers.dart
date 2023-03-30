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
    var expiredTimers = widget.data.getExpiredTimers();
    List<Widget> widgetlist = [];
    for (var expiredTimer in expiredTimers) {
      var expireddata = ExpiredTimerData();
      expireddata.refresh = refresh;
      expireddata.timer = expiredTimer;
      expireddata.color = widget.data.colorOf(expiredTimer.category);
      var timerwidget = ExpiredTimer(expireddata);
      widgetlist.add(timerwidget);
    }
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            AppLocalizations.of(context)!.extimer,
          ),
        ),
        body: Row(
          children: [
            new ElevatedButton(
              onPressed: gotoActiveTimers,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.arrow_back_outlined),
            ),
            Expanded(
              child: ListView(primary: true, scrollDirection: Axis.vertical, children: [
                Column(children: widgetlist),
              ]),
            ),
          ],
        ));
  }

  void gotoActiveTimers() {
    Navigator.of(context).pop();
  }

  void refresh() {
    setState(() {});
  }
}
