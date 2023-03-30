import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewTimer extends StatefulWidget {
  const NewTimer({Key? key}) : super(key: key);

  @override
  State<NewTimer> createState() => _NewTimerState();
}

class _NewTimerState extends State<NewTimer> {
  var text3 = "";
  var text4 = "";
  TextEditingController controller3 = TextEditingController(text: "");
  TextEditingController controller4 = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
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
    controller3.dispose();
    controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 300,
              child: new TextField(
                  maxLength: 20,
                  controller: controller3,
                  decoration: InputDecoration(
                    counterStyle: Theme.of(context).textTheme.labelSmall,
                    border: UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.name,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  )),
            ),
            Container(
              width: 30,
              height: 1,
            ),
            Container(
              width: 55,
              child: new TextField(
                  maxLength: 2,
                  controller: controller4,
                  decoration: InputDecoration(
                    counterStyle: Theme.of(context).textTheme.labelSmall,
                    border: UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.time,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  new Text("min", style: Theme.of(context).textTheme.bodySmall),
            ),
          ]),
        ],
      ),
    );
  }

  void onSave() {}

  void onNeueZeile() {}
}
