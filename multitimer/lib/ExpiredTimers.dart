import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpiredTimers extends StatelessWidget {
  const ExpiredTimers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          new AppBar(title: new Text(AppLocalizations.of(context)!.extimer)),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                color: Colors.yellow,
                width: 400,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: new Text(
                          "Nudeln Kochen",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      new Text(
                        "Phase 1 von 3 ist aktiv:",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      new Text("Wasser zum kochen bringen.",
                          style: Theme.of(context).textTheme.bodySmall),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: new Text("Klingelt in 2:56",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              new ElevatedButton(
                                onPressed: onPressed,
                                child: Icon(Icons.restore_from_trash),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                ),
                              ),
                              new Text("Verwerfen",
                                  style: Theme.of(context).textTheme.labelSmall)
                            ],
                          ),
                          Column(
                            children: [
                              new ElevatedButton(
                                  onPressed: onClicked,
                                  child: Icon(Icons.restart_alt),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(20),
                                  )),
                              new Text("Neu Starten",
                                  style: Theme.of(context).textTheme.labelSmall)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(color: Colors.blue, width: 400, height: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(color: Colors.red, width: 400, height: 200),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}

  void onClicked() {}
}
