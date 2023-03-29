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
        appBar:
            new AppBar(title: new Text(AppLocalizations.of(context)!.aktimer)),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ActiveTimer(),
                    ActiveTimer(),
                  ],
                ),
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
          ),
        ));
  }

  void onPressed() {}

  void onClicked() {}

  void onTouched() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ExpiredTimers()));
  }
}
