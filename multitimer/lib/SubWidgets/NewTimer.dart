import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewTimer extends StatefulWidget {
  const NewTimer({Key? key}) : super(key: key);

  @override
  State<NewTimer> createState() => _NewTimerState();
}

class _NewTimerState extends State<NewTimer> {
  var message = "";
  var duration = "";
  TextEditingController messageController = TextEditingController(text: "");
  TextEditingController timeController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    messageController.text = message;
    messageController.addListener(() {
      setState(() {
        message = messageController.text;
      });
    });

    timeController.text = duration;
    timeController.addListener(() {
      setState(() {
        duration = timeController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    timeController.dispose();
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
              width: 240,
              child: new TextField(
                  maxLength: 20,
                  controller: messageController,
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
                  maxLength: 3,
                  controller: timeController,
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
              child: new Text("min", style: Theme.of(context).textTheme.bodySmall),
            ),
          ]),
        ],
      ),
    );
  }
}
