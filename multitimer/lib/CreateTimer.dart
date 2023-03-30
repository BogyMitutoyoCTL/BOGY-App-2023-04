import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/Data.dart';

import 'SubWidgets/Categoryselect.dart';
import 'SubWidgets/NewTimerCreate.dart';

class CreateTimer extends StatefulWidget {
  Data data;

  CreateTimer(Data this.data, {Key? key}) : super(key: key);

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  var timerName = "";
  TextEditingController nameController = TextEditingController(text: "");

  _CreateTimerState();

  @override
  void initState() {
    super.initState();
    nameController.text = timerName;
    nameController.addListener(() {
      setState(() {
        timerName = nameController.text;
      });
    });
    // A new timer needs at least one time segment
    addSection();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    List<Widget> plusButton;
    var elevatedPlusButton = ElevatedButton(
      onPressed: addSection,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Icon(Icons.add),
    );
    if (sections.length < 4) {
      plusButton = [elevatedPlusButton];
    } else {
      plusButton = [];
    }

    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        AppLocalizations.of(context)!.newtimer,
      )),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              new Text(
                "Name: ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(width: 500, child: new TextField(controller: nameController)),
              Container(
                height: 10,
              ),
              new Text(
                AppLocalizations.of(context)!.category + ":",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Categoyselect(widget.data),
              new Text(
                AppLocalizations.of(context)!.time + ":",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(children: sections),
              Container(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: plusButton,
                ),
              ),
              Container(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new ElevatedButton(onPressed: onSave, child: new Text(AppLocalizations.of(context)!.save, style: Theme.of(context).textTheme.bodySmall)),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  void addSection() {
    if (sections.length < 4) {
      setState(() {
        sections.add(NewTimer());
      });
    }
  }

  List<Widget> sections = <Widget>[];
  void onSave() {}

  onChangedDropdown() {}
}
