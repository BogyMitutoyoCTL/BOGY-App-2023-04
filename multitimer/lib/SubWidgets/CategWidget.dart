import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/CategWidgetData.dart';

import '../TimersInCategories.dart';
import '../data/TimersInCategData.dart';

class CategoryWidget extends StatefulWidget {
  CategWidgetData data;

  CategoryWidget(CategWidgetData this.data, {Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  //
  Color categColor = Colors.red;
  Color lastSavedColor = Colors.red;
  //
  final myController = TextEditingController();

  _CategoryWidgetState();
  void _printLatestValue() {
    print('Text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    Widget container;
    myController.text = widget.data.category.name;
    if (myController.text == "") {
      myController.text = AppLocalizations.of(context)!.newcateg;
    }
    myController.addListener(() {
      widget.data.category.name = myController.text;
    });
    if (widget.data.editEnabled == true) {
      container = TextFormField(
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.newcateg,
          border: UnderlineInputBorder(),
        ),
        controller: myController,
        maxLines: 1,
        maxLength: 20,
        showCursor: true,
        enabled: widget.data.editEnabled,
      );
    } else {
      container = Text(widget.data.category.name,
          style: Theme.of(context).textTheme.bodyMedium);
    }
    /////
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(widget.data.color)),
                onPressed: onCategoryPress,
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 200, child: container)),
                  IconButton(
                    onPressed: onClickNameChange,
                    icon: Icon(Icons.edit),
                    splashRadius: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: onClickDeleteCategory,
                      icon: Icon(Icons.delete_forever),
                      splashRadius: 15,
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  void onClickNameChange() {
    setState(() {
      widget.data.editEnabled = !widget.data.editEnabled;
      widget.data.category.name = myController.text;
    });
  }

  void onClickDeleteCategory() {
    widget.data.delete(widget.data.category);
  }

  void onCategoryPress() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      var timersInCategData = TimersInCategData();
      timersInCategData.category = widget.data.category;
      timersInCategData.color = widget.data.color;
      timersInCategData.data = widget.data.data;
      return TimersInCategories(timersInCategData);
    })); //Neuer Timer
  }
}
