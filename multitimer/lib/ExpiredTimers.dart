import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'SubWidgets/ExpiredTimer.dart';

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
        body: Row(
          children: [
            new ElevatedButton(
              onPressed: onTouched,
              child: Icon(Icons.arrow_back_outlined),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
            ExpiredTimer()
          ],
        ));
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context).pop();
  }
}
