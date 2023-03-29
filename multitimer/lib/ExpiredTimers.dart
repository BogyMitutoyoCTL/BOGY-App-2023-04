import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpiredTimers extends StatefulWidget {
  const ExpiredTimers({Key? key}) : super(key: key);

  @override
  State<ExpiredTimers> createState() => _ExpiredTimersState();
}

class _ExpiredTimersState extends State<ExpiredTimers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          new AppBar(title: new Text(AppLocalizations.of(context)!.extimer)),
      body: Center(
        child: Row(
          children: [
            new ElevatedButton(
              onPressed: onTouched,
              child: Icon(Icons.arrow_back_outlined),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(
                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          new Text("Klingelt in 2:56",
                              style: Theme.of(context).textTheme.bodySmall),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    new ElevatedButton(
                                      onPressed: onPressed,
                                      child: Icon(
                                        Icons.play_arrow_outlined,
                                        size: 15,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(20),
                                      ),
                                    ),
                                    new Text("Nächste Phase",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ],
                                ),
                                Column(
                                  children: [
                                    new ElevatedButton(
                                        onPressed: onClicked,
                                        child: Icon(
                                          Icons.check_box,
                                          size: 15,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(20),
                                        )),
                                    new Text("Fertig",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context).pop();
  }
}
