import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ExpiredTimers.dart';
import 'package:multitimer/data/Activetimerdata.dart';

import 'SubWidgets/ActiveTimer.dart';
import 'data/Data.dart';

class ActiveTimers extends StatefulWidget {
  Data data;

  ActiveTimers(this.data, {Key? key}) : super(key: key);
  @override
  State<ActiveTimers> createState() => _ActiveTimersState();
}

class _ActiveTimersState extends State<ActiveTimers> {
  @override
  Widget build(BuildContext context) {
    var activeTimers = widget.data.getActiveTimers();
    List<Widget> widgetlist = [];
    for (var activeTimer in activeTimers) {
      var activedata = ActiveTimerdata();
      activedata.reload = reload;
      activedata.timer = activeTimer;
      activedata.color = widget.data.colorOf(activeTimer.category);
      var subwidget = ActiveTimer(activedata);
      widgetlist.add(subwidget);
    }

    return Scaffold(
        appBar: new AppBar(
            title: new Text(
          AppLocalizations.of(context)!.aktimer,
        )),
        body: Row(
          children: [
            Expanded(
              child: ListView(primary: true, scrollDirection: Axis.vertical, children: [
                Column(children: widgetlist),
              ]),
            ),
            new ElevatedButton(
              onPressed: goToExpired,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.arrow_forward_outlined),
            ),
          ],
        ));
  }

  void goToExpired() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpiredTimers(widget.data)));
  }

  void reload() {
    setState(() {});
  }
}
