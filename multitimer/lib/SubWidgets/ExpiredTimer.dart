import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpiredTimer extends StatefulWidget {
  const ExpiredTimer({Key? key}) : super(key: key);

  @override
  State<ExpiredTimer> createState() => _ExpiredTimerState();
}

class _ExpiredTimerState extends State<ExpiredTimer> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    "Nudeln Kochen",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  new Text(
                    "Phase 1 von 3 ist aktiv:",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  new Text("Wasser zum kochen bringen.",
                      style: Theme.of(context).textTheme.bodySmall),
                  new Text("Klingelt in 2:56 min",
                      style: Theme.of(context).textTheme.bodySmall),
                  new Container(
                    height: 15,
                    width: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            new ElevatedButton(
                              onPressed: onNext,
                              child: Icon(
                                Icons.play_arrow_outlined,
                                size: 15,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            new Text(AppLocalizations.of(context)!.next,
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          new ElevatedButton(
                              onPressed: onDone,
                              child: Icon(
                                Icons.check_box,
                                size: 15,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              )),
                          new Text(AppLocalizations.of(context)!.finish,
                              style: Theme.of(context).textTheme.bodySmall)
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

  void onNext() {}

  void onDone() {}

  void onTouched() {
    Navigator.of(context).pop();
  }
}
