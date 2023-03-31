import 'package:flutter/material.dart';
import 'package:multitimer/CreateTimer.dart';
import 'package:multitimer/data/Timer.dart';
import 'package:multitimer/data/TimersInCategData.dart';

import 'SubWidgets/TimerTile.dart';
import 'data/CreateTimerData.dart';
import 'data/TimeTileData.dart';
import 'data/TimerCategory.dart';

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
    for (var aTimer in widget.data.category.getStartableTimers()) {
      var timersWidgetData = TimerTileData();
      timersWidgetData.timer = aTimer;
      timersWidgetData.color = widget.data.color;
      timersWidgetData.refresh = refresh;
      var timerWidget = new TimerTile(timersWidgetData);
      timerListe.add(timerWidget);
    }
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        widget.data.category.name,
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: new ListView(
          scrollDirection: Axis.vertical,
          primary: true,
          children: [
            Column(
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: onClickAdd,
                        icon: Icon(Icons.add_circle),
                        padding: EdgeInsets.all(20.0),
                        splashRadius: 30.0,
                        iconSize: 50,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: timerListe,
                )
              ],
            ),
          ]),
    );
  }

  void onClickAdd() {
    CreateTimerData data = new CreateTimerData();
    data.data = widget.data.data;
    data.timerToEdit = new Timer();
    TimerCategory dummy = new TimerCategory();
    dummy.timers.add(data.timerToEdit);
    data.categoryOfTimer = widget.data.category;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateTimer(data))); //Neuer Timer
  }

  void refresh() {
    setState(() {});
  }
}
