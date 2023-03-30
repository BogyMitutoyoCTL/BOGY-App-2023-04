import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/CategorySelectData.dart';
import 'package:multitimer/data/Data.dart';

import 'SubWidgets/Categoryselect.dart';
import 'SubWidgets/NewTimer.dart';
import 'data/Timer.dart';

class CreateTimer extends StatefulWidget {
  Data data;

  CreateTimer(Data this.data, {Key? key}) : super(key: key);

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  var timerName = "";
  TextEditingController nameController = TextEditingController(text: "");
  CategorySelectData categorySelectionData = CategorySelectData();

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
    Widget plusButton;
    if (sections.length < 4) {
      plusButton = ElevatedButton(
        onPressed: addSection,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
        ),
        child: Icon(Icons.add),
      );
    } else {
      plusButton = Container();
    }

    categorySelectionData.categories = widget.data.categories;
    categorySelectionData.selectedCategory = widget.data.categories.first;

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
              Categoyselect(categorySelectionData),
              new Text(
                AppLocalizations.of(context)!.time + ":",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(children: sections),
              Container(
                height: 30,
              ),
              plusButton,
              Container(
                height: 30,
              ),
              SizedBox(
                width: 150,
                child: new ElevatedButton(
                    onPressed: isInputValid() ? onSave : null,
                    child: new Text(AppLocalizations.of(context)!.save, style: Theme.of(context).textTheme.bodySmall)),
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

  List<NewTimer> sections = [];
  void onSave() {
    Timer timer = new Timer();
    timer.name = timerName;
    // TODO: create sections
    // TODO: add sections to the timer
    categorySelectionData.selectedCategory.timers.add(timer);

    goBack();
  }

  bool isInputValid() {
    bool valid = timerName.isNotEmpty;
    for (var section in sections) {
      valid &= true; // TODO: access info from subwidget
    }
    return valid;
  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
