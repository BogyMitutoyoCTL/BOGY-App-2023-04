import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActiveTimer extends StatelessWidget {
  const ActiveTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                      child: new Text("Klingelt in 2:56 min",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            new ElevatedButton(
                              onPressed: onDelete,
                              child: Icon(
                                Icons.restore_from_trash,
                                size: 15,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            new Text(AppLocalizations.of(context)!.discard,
                                style: Theme.of(context).textTheme.labelSmall)
                          ],
                        ),
                        Column(
                          children: [
                            new ElevatedButton(
                                onPressed: onRestart,
                                child: Icon(
                                  Icons.restart_alt,
                                  size: 15,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                )),
                            new Text(AppLocalizations.of(context)!.restart,
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
            child: new Container(color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(color: Colors.red),
          ),
        ],
      ),
    );
  }

  void onDelete() {}

  void onRestart() {}
}
