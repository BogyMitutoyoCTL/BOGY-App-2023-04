import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/Data.dart';

class CreateTimer extends StatefulWidget {
  Data data;

  CreateTimer(Data this.data, {Key? key}) : super(key: key);

  @override
  State<CreateTimer> createState() => _CreateTimerState(data);
}

class _CreateTimerState extends State<CreateTimer> {
  var text = "  ";
  var text2 = "  ";
  TextEditingController controller = TextEditingController(text: "");
  TextEditingController controller2 = TextEditingController(text: "");

  Data data;

  _CreateTimerState(Data this.data);

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          new AppBar(title: new Text(AppLocalizations.of(context)!.newtimer)),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Name: ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                new TextField(controller: controller),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    AppLocalizations.of(context)!.category + ":",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                new TextField(
                  controller: controller2,
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
                      children: [
                        ElevatedButton(
                          onPressed: onClickAdd,
                          child: Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                      ],
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
                            child:
                                new Text(AppLocalizations.of(context)!.save)),
                      ],
                    ),
                  ),
                ),
              ]),
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
}
