import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/ExpiredTimerData.dart';

class ExpiredTimer extends StatefulWidget {
  ExpiredTimerData data;

  ExpiredTimer(ExpiredTimerData this.data, {Key? key}) : super(key: key);

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
            color: widget.data.color,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    widget.data.timer.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  new Text(
                    "Phase " +
                        (widget.data.timer.activesectionnumber + 1).toString() +
                        " " +
                        AppLocalizations.of(context)!.oof +
                        " " +
                        widget.data.timer.sections.length.toString() +
                        " " +
                        AppLocalizations.of(context)!.phase,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  new Text(widget.data.timer.sections[0].message,
                      style: Theme.of(context).textTheme.bodySmall),
                  new Container(
                    height: 15,
                    width: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            new IconButton(
                              onPressed: onNext,
                              icon: Icon(
                                Icons.play_arrow_outlined,
                                size: 30,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            new Text(AppLocalizations.of(context)!.next,
                                style: Theme.of(context).textTheme.labelMedium)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          new IconButton(
                              onPressed: onDone,
                              icon: Icon(
                                Icons.check_box,
                                size: 30,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              )),
                          new Text(AppLocalizations.of(context)!.finish,
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

  void onNext() {
    if (widget.data.timer.activesectionnumber ==widget.data.timer.sections) {
      widget.data
    }
    setState(() {
      print("start next section");
      widget.data.timer.nextsection();
      widget.data.refresh();
    });
  }

  void onDone() {
    setState(() {
      widget.data.timer.deactivate();
      widget.data.refresh();
    });
  }

  void onTouched() {
    Navigator.of(context).pop();
  }
}
