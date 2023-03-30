import 'package:flutter/material.dart';
import 'package:multitimer/data/TimersInCategData.dart';

import '../data/TimeTileData.dart';
import 'TimerTile.dart';

class TimersInCategories extends StatefulWidget {
  TimersInCategData data;

  TimersInCategories(TimersInCategData this.data, {Key? key}) : super(key: key);

  @override
  State<TimersInCategories> createState() => _TimersInCategoriesState();
}

class _TimersInCategoriesState extends State<TimersInCategories> {
  @override
  Widget build(BuildContext context) {
    List<Widget> timerListe = [];
    for (int i = 0; i < widget.data.category.timers.length; i++) {
      var aTimer = widget.data.category.timers[i];
      var timersWidgetData = TimerTileData();
      timersWidgetData.timer = aTimer;
      timersWidgetData.color = widget.data.color;
      var timerWidget = new TimerTile(timersWidgetData);
      timerListe.add(timerWidget);
    }
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.data.category.name)),
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: timerListe,
        ),
      ),
    );
  }
}
