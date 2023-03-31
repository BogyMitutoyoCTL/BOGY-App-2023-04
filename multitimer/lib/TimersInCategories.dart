import 'package:flutter/material.dart';
import 'package:multitimer/data/TimersInCategData.dart';

import 'SubWidgets/TimerTile.dart';
import 'data/TimeTileData.dart';

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

  void refresh() {
    setState(() {});
  }

  void onClickAdd() {}
}
