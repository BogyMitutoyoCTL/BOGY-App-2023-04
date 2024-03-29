import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/CategorySelectData.dart';
import 'package:multitimer/data/NewSectionData.dart';
import 'package:multitimer/data/Storage.dart';
import 'package:multitimer/data/TimerCategory.dart';

import 'SubWidgets/Categoryselect.dart';
import 'data/CreateTimerData.dart';
import 'data/Section.dart';
import 'subwidgets/NewSection.dart';

class CreateTimer extends StatefulWidget {
  CreateTimerData data;
  CategorySelectData categorySelectionData = CategorySelectData();

  CreateTimer(this.data, {Key? key}) : super(key: key) {
    categorySelectionData.categories = data.everything.categories;
    if (data.categoryOfTimer == TimerCategory.empty)
      categorySelectionData.selectedCategory = data.everything.categories.first;
    else
      categorySelectionData.selectedCategory = data.categoryOfTimer;
  }

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  late String timerName = "xxx";
  TextEditingController nameController = TextEditingController();

  _CreateTimerState();
  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    nameController.text = timerName;
    nameController.addListener(() {
      setState(() {
        timerName = nameController.text;
      });
    });
    timerName = widget.data.timerToEdit.name;
    nameController.text = timerName;
    // A new timer needs at least one time segment
    for (var section in widget.data.timerToEdit.sections) {
      NewSectionData s = new NewSectionData();
      s.message = section.message;
      s.duration = section.duration;
      sectionData.add(s);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget plusButton;
    if (sectionData.length < 4) {
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

    List<Widget> sectionWidgets = [];
    for (var sectionData in sectionData) {
      sectionWidgets.add(NewSection(sectionData));
    }

    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        AppLocalizations.of(context)!.newtimer,
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    "Name: ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                      width: 500,
                      child: new TextField(controller: nameController)),
                  Container(
                    height: 10,
                  ),
                  new Text(
                    AppLocalizations.of(context)!.category + ":",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Categoyselect(widget.categorySelectionData),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Text(
                      AppLocalizations.of(context)!.time + ":",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Column(children: sectionWidgets),
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
                        child: new Text(AppLocalizations.of(context)!.save,
                            style: Theme.of(context).textTheme.bodySmall)),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }

  void addSection() {
    if (sectionData.length < 4) {
      setState(() {
        var newSectionData = NewSectionData();
        newSectionData.refreshParent = refresh;
        sectionData.add(newSectionData);
      });
    }
  }

  List<NewSectionData> sectionData = [];

  Future<void> onSave() async {
    widget.data.timerToEdit.name = timerName;
    widget.data.timerToEdit.sections.clear();
    for (var sectionData in sectionData) {
      Section s = new Section();
      s.message = sectionData.message;
      s.duration = sectionData.duration;
      widget.data.timerToEdit.sections.add(s);
    }
    widget.data.categoryOfTimer.timers.remove(widget.data.timerToEdit);
    widget.categorySelectionData.selectedCategory.timers
        .add(widget.data.timerToEdit);
    await Storage().save(widget.data.everything);
    goBack();
  }

  bool isInputValid() {
    bool valid = timerName.isNotEmpty;
    for (var section in sectionData) {
      valid &= section.message.isNotEmpty;
      valid &= section.duration.inMinutes != 0;
    }
    return valid;
  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
