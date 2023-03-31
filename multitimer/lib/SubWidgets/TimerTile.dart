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
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            child: new Container(
              color: widget.data.color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new Text(widget.data.timer.name,
                        style: Theme.of(context).textTheme.bodyMedium),
                    new Text("", style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
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
                      onPressed: onPressPlayButton(),
                      child: Icon(Icons.play_arrow),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onPressEditButton(),
                      child: Icon(Icons.edit),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onPressDeleteButton(),
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
    );
  }

  onPressPlayButton() {}

  onPressEditButton() {}

  onPressDeleteButton() {}
}
