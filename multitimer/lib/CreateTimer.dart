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
  var text3 = "  ";
  var text4 = "  ";
  TextEditingController controller = TextEditingController(text: "");
  TextEditingController controller2 = TextEditingController(text: "");
  TextEditingController controller3 = TextEditingController(text: "");
  TextEditingController controller4 = TextEditingController(text: "");

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

    controller3.text = text3;
    controller3.addListener(() {
      setState(() {
        text3 = controller3.text;
      });
    });

    controller4.text = text4;
    controller4.addListener(() {
      setState(() {
        text4 = controller4.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          new AppBar(title: new Text(AppLocalizations.of(context)!.newtimer)),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              new Text(
                "Name: ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              new Container(
                width: 200,
                height: 10,
              ),
              new TextField(controller: controller),
              new Container(
                width: 200,
                height: 50,
              ),
              new Text(
                AppLocalizations.of(context)!.category + ":",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              new Container(width: 200, height: 10),
              new TextField(
                controller: controller2,
              ),
              new Container(
                width: 200,
                height: 70,
              ),
              new Text(
                AppLocalizations.of(context)!.time + ":",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              new Container(
                width: 200,
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 200,
                  child: new TextFormField(
                      controller: controller3,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.name,
                        labelStyle: Theme.of(context).textTheme.labelSmall,
                      )),
                ),
                Expanded(child: new Container(width: 75)),
                Container(
                  width: 55,
                  child: new TextFormField(
                      controller: controller4,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.time,
                        labelStyle: Theme.of(context).textTheme.labelSmall,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        LengthLimitingTextInputFormatter(3)
                      ]),
                ),
                new Text("min", style: Theme.of(context).textTheme.bodySmall),
                new Container(height: 30),
              ]),
              new Container(height: 20),
              ElevatedButton(
                onPressed: onNeueZeile,
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ]),
            Center(
              child: new ElevatedButton(
                  onPressed: onSave,
                  child: new Text(AppLocalizations.of(context)!.save)),
            ),
          ],
        ),
      ),
    );
  }

  void onSave() {}
  void onNeueZeile() {}
}
