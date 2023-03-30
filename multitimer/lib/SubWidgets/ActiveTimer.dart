import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActiveTimer extends StatelessWidget {
  const ActiveTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    height: 20,
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
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
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
