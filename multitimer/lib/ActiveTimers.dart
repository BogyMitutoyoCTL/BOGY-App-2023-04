import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/ExpiredTimers.dart';
import 'package:multitimer/SubWidgets/ActiveTimer.dart';

class ActiveTimers extends StatefulWidget {
  var data;

  ActiveTimers(this.data, {Key? key}) : super(key: key);
  @override
  State<ActiveTimers> createState() => _ActiveTimersState();
}

class _ActiveTimersState extends State<ActiveTimers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text(AppLocalizations.of(context)!.aktimer,
                style: Theme.of(context).textTheme.titleLarge)),
        body: Row(
          children: [
            Expanded(
              child: ListView(
                  primary: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        ActiveTimer(),
                        ActiveTimer(),
                        ActiveTimer(),
                        ActiveTimer(),
                        ActiveTimer(),
                      ],
                    ),
                  ]),
            ),
            new ElevatedButton(
              onPressed: onTouched,
              child: Icon(Icons.arrow_forward_outlined),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ));
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ExpiredTimers()));
  }
}
