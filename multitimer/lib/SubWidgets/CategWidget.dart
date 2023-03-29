import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  //
  var categName = "";
  bool textfieldEnabled = false;
  Color categColor = Colors.red;
  Color lastSavedColor = Colors.red;
  //
  final myController = TextEditingController();
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
    Container container;

    if (textfieldEnabled == true) {
      container = Container(
        width: 200,
        child: TextField(
          controller: myController,
          maxLines: 1,
          maxLength: 20,
          showCursor: true,
          enabled: textfieldEnabled,
        ),
      );
    }
    ////
    else if (categName == "") {
      container = Container(
        width: 200,
        child: Text(categName = AppLocalizations.of(context)!.newcateg),
      );
    } else {
      container = Container(
        width: 200,
        child: Text(categName),
      );
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: getCategColor(),
                ),
                onPressed: onCategoryPress,
                child: Row(children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: container),
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
      textfieldEnabled = !textfieldEnabled;
      categName = myController.text;
    });
  }

  Color getCategColor() {
    var c = 1;
    for (int i = 0; i < 10; i++) {
      List liste = [
        Colors.red, //1
        Colors.blue, //2
        Colors.green, //3
        Colors.amber, //4
        Colors.purple, //5
        Colors.yellow, //6
        Colors.pink, //7
        Colors.greenAccent, //8
        Colors.brown //9
      ];
      Color colorMatch = liste[c];
      c = c + 2;
      if (lastSavedColor != colorMatch) {
        categColor = colorMatch;
        lastSavedColor = liste[c];
        break;
      }
    }
    return categColor;
  }

  void onClickDeleteCategory() {}

  void onCategoryPress() {}
}
