import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/TimersInCategData.dart';

class TimersInCategories extends StatefulWidget {
  TimersInCategData data;

  TimersInCategories(TimersInCategData this.data, {Key? key}) : super(key: key);

  @override
  State<TimersInCategories> createState() => _TimersInCategoriesState();
}

class _TimersInCategoriesState extends State<TimersInCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.data.category.name)),
      body: Center(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimerTile(),
              TimerTile(),
              TimerTile(),
            ]),
      ),
    );
  }
}

/////////////////////////////////TIMER CLASS

class TimerTile extends StatefulWidget {
  const TimerTile({Key? key}) : super(key: key);

  @override
  State<TimerTile> createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        //Nudeln kochen
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Expanded(
              child: new Container(
                width: 290,
                height: 145,
                color: Colors.yellow,
                child: Center(
                  child: Column(
                    children: [
                      new Text(AppLocalizations.of(context)!.cookn,
                          style: Theme.of(context).textTheme.labelMedium),
                      new Text("1.)",
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
                      height: 48,
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
                      height: 49,
                      child: ElevatedButton(
                        onPressed: () {},
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
}
