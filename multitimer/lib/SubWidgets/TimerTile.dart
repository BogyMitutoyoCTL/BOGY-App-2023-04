import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Expanded(
              child: new Container(
                width: 290,
                height: 145,
                color: widget.data.color,
                child: Center(
                  child: Column(
                    children: [
                      new Text(widget.data.timer.name,
                          style: Theme.of(context).textTheme.labelMedium),
                      new Text("",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ),
            new Container(
              width: 1,
              height: 145,
              color: Colors.black,
            ),
            new Container(
              width: 100,
              height: 145,
              color: Colors.yellow,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: onPlay,
                        child: Icon(Icons.play_arrow),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: onEdit,
                        child: Icon(Icons.edit),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 49,
                      child: ElevatedButton(
                        onPressed: onTrash,
                        child: Icon(CupertinoIcons.trash),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  void onPlay() {}

  void onEdit() {}

  void onTrash() {
    setState(() {
      widget.data.timer.deactivate();
      widget.data.refresh();
      widget.data.timer.category.timers.remove(widget.data.timer);
    });
  }
}
