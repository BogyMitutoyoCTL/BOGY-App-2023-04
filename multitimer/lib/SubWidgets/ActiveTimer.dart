import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/Activetimerdata.dart';

class ActiveTimer extends StatefulWidget {
  ActiveTimerdata data;

  ActiveTimer(this.data, {Key? key}) : super(key: key);

  @override
  State<ActiveTimer> createState() => _ActiveTimerState();
}

class _ActiveTimerState extends State<ActiveTimer> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: new Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: new Text(
                      widget.data.timer.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  new Text(
                    widget.data.timer.sections[0].message,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  new Text("Wasser zum kochen bringen.",
                      style: Theme.of(context).textTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: new Text("Klingelt in 2:56 min",
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          new IconButton(
                            onPressed: onDelete,
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                            ),
                          ),
                          new Text(AppLocalizations.of(context)!.discard,
                              style: Theme.of(context).textTheme.labelMedium)
                        ],
                      ),
                      new Container(
                        height: 15,
                        width: 30,
                      ),
                      Column(
                        children: [
                          new IconButton(
                              onPressed: onRestart,
                              icon: Icon(Icons.restart_alt, size: 30),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              )),
                          new Text(AppLocalizations.of(context)!.restart,
                              style: Theme.of(context).textTheme.labelMedium)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onDelete() {}

  void onRestart() {}
}
