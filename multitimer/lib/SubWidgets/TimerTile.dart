import 'package:flutter/material.dart';
import 'package:multitimer/ActiveTimers.dart';
import 'package:multitimer/CreateTimer.dart';
import 'package:multitimer/data/CreateTimerData.dart';
import 'package:multitimer/data/TimeTileData.dart';

class TimerTile extends StatefulWidget {
  TimerTileData data;

  TimerTile(TimerTileData this.data, {Key? key}) : super(key: key);

  @override
  State<TimerTile> createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            child: new Container(
              width: 300,
              height: 150,
              color: widget.data.color,
              child: Column(
                children: [
                  new Text(widget.data.timer.name,
                      style: Theme.of(context).textTheme.bodySmall),
                  new Text(timerPhasen(),
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),
          ),
          new Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onPlay,
                      child: Icon(Icons.play_arrow),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onEdit,
                      child: Icon(Icons.edit),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onTrash,
                      child: Icon(Icons.delete_forever),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }

  void onPlay() {
    widget.data.timer.activate();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ActiveTimers(widget.data.data)));
  }

  void onEdit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      var createTimerData = CreateTimerData();
      createTimerData.everything = widget.data.data;
      createTimerData.categoryOfTimer = widget.data.timer.category;
      createTimerData.timerToEdit = widget.data.timer;

      return CreateTimer(createTimerData);
    }));
  }

  void onTrash() {
    setState(() {
      widget.data.timer.deactivate();
      widget.data.refresh();
      widget.data.timer.category.timers.remove(widget.data.timer);
    });
  }

  String timerPhasen() {
    String phasen = "";
    for (int i = 0; i < widget.data.timer.sections.length; i++) {
      int ii = i + 1;
      phasen = phasen +
          "Phase $ii: " +
          widget.data.timer.sections[i].message +
          " " +
          widget.data.timer.sections[i].getRemainingTime() +
          "\n";
    }
    return phasen;
  }
}
