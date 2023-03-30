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
  var text = "";
  var text2 = "";
  TextEditingController controller = TextEditingController(text: "");
  TextEditingController controller2 = TextEditingController(text: "");

  _CreateTimerState();

  @override
  void initState() {
    super.initState();
    controller.text = text;
    controller.addListener(() {
      setState(() {
        text = controller.text;
      });
    });

    controller2.text = text2;
    controller2.addListener(() {
      setState(() {
        text2 = controller2.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller2.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    List<Widget> children2;
    var elevatedPlusButton = ElevatedButton(
      onPressed: onClickAdd,
      child: Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
    if (extractedChildren.length < 4) {
      children2 = [elevatedPlusButton];
    } else {
      children2 = [];
    }

    return Scaffold(
      appBar: new AppBar(
          title: new Text(AppLocalizations.of(context)!.newtimer,
              style: Theme.of(context).textTheme.titleLarge)),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Name: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Container(
                      width: 500, child: new TextField(controller: controller)),
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      AppLocalizations.of(context)!.category + ":",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0), /////////////////
                    child: Categoyselect(widget.data),
                    /*new DropdownButton(
                      hint: Text(
                        "Choose a Category",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      items: list,
                      onChanged: onChangedDropdown(),
                    ),*/
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      AppLocalizations.of(context)!.time + ":",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Column(children: extractedChildren),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: children2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          new ElevatedButton(
                              onPressed: onSave,
                              child: new Text(
                                  AppLocalizations.of(context)!.save,
                                  style:
                                      Theme.of(context).textTheme.bodySmall)),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }

  void onClickAdd() {
    if (extractedChildren.length < 4) {
      setState(() {
        extractedChildren.add(NewTimer());
      });
    }
  }

  List<Widget> extractedChildren = <Widget>[];
  void onSave() {}

  onChangedDropdown() {}
}
