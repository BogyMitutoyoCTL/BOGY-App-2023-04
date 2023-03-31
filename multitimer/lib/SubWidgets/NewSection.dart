import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/NewSectionData.dart';

class NewSection extends StatefulWidget {
  NewSectionData data;

  NewSection(this.data, {Key? key}) : super(key: key);

  @override
  State<NewSection> createState() => _NewSectionState();
}

class _NewSectionState extends State<NewSection> {
  TextEditingController messageController = TextEditingController(text: "");
  TextEditingController timeController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    messageController.text = widget.data.message;
    messageController.addListener(() {
      setState(() {
        widget.data.message = messageController.text;
      });
    });

    timeController.text = widget.data.duration.inMinutes.toString();
    timeController.addListener(() {
      setState(() {
        var minutes = int.tryParse(timeController.text);
        minutes ??= 0;
        widget.data.duration = Duration(minutes: minutes);
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
