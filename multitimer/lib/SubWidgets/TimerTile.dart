import 'package:flutter/material.dart';
import 'package:multitimer/data/TimeTileData.dart';

import '../data/SectionTimerData.dart';
import 'SectionTimer.dart';

class TimerTile extends StatefulWidget {
  TimerTileData data;

  TimerTile(TimerTileData this.data, {Key? key}) : super(key: key);

  @override
  State<TimerTile> createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  @override
  Widget build(BuildContext context) {
    var sectionTimerData = SectionTimerData();
    sectionTimerData.sections = widget.data.timer.sections;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: new Container(
              width: 290,
              height: 145,
              color: Colors.yellow,
              child: Center(
                child: Column(
                  children: [
                    new Text(widget.data.timer.name,
                        style: Theme.of(context).textTheme.bodyMedium),
                    SectionTimer(sectionTimerData),
                  ],
                ),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.edit),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.delete_forever),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
