// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:multitimer/data/Data.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  Data data;

  Settings(Data this.data, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState(data);
}

class _SettingsState extends State<Settings> {
  ThemeMode theme = ThemeMode.light;
  Color color = Colors.black87;
  Color textcolor = Colors.white;
  Color appbar = Colors.blue;

  Data data;

  _SettingsState(Data this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                AppLocalizations.of(context)!.settings,
                style: TextStyle(color: textcolor),
              ),
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: appbar,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  AppLocalizations.of(context)!.changetheme,
                  textScaleFactor: 1.7,
                  style: TextStyle(color: textcolor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: ThemeMode.light,
                  groupValue: theme,
                  onChanged: onClickedRadio,
                ),
                ElevatedButton(
                  child: Container(
                    height: 90,
                    width: 60,
                  ),
                  onPressed: onClickWhite,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                  ),
                ),
                Container(
                  height: 3,
                  width: 90,
                ),
                Radio(
                    value: ThemeMode.dark,
                    groupValue: theme,
                    onChanged: onClickedRadio),
                ElevatedButton(
                  child: Container(
                    height: 90,
                    width: 60,
                  ),
                  onPressed: onClickBlack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.red,
                      groupValue: appbar,
                      onChanged: onChangeAppBar),
                  ElevatedButton(
                    onPressed: onClickRed,
                    child: Text(AppLocalizations.of(context)!.red),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.amber,
                      groupValue: appbar,
                      onChanged: onChangeAppBar),
                  ElevatedButton(
                    onPressed: onClickOrange,
                    child: Text(AppLocalizations.of(context)!.orange),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.blue,
                      groupValue: appbar,
                      onChanged: onChangeAppBar),
                  ElevatedButton(
                    onPressed: onClickBlue,
                    child: Text(AppLocalizations.of(context)!.blue),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.lightGreen,
                      groupValue: appbar,
                      onChanged: onChangeAppBar),
                  ElevatedButton(
                    onPressed: onClickGreen,
                    child: Text(AppLocalizations.of(context)!.green),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.redAccent,
                      groupValue: appbar,
                      onChanged: onChangeAppBar),
                  ElevatedButton(
                    onPressed: onClickRedAccent,
                    child: Text(AppLocalizations.of(context)!.redaccent),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: onClickDonate,
                  child: Container(
                    color: textcolor,
                    child: Text(
                      AppLocalizations.of(context)!.donate,
                      style: TextStyle(
                          color: Colors.blue[800], fontFamily: 'Shyler'),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void onClickWhite() {
    setState(() {
      theme = ThemeMode.light;
      color = Colors.grey;
      textcolor = Colors.black87;
    });
  }

  void onClickBlack() {
    setState(() {
      theme = ThemeMode.dark;
      color = Colors.black87;
      textcolor = Colors.white;
    });
  }

  void onClickDonate() {
    launchUrlString('https://www.paypal.com/myaccount/summary');
  }

  void onClickedRadio(ThemeMode? value) {
    setState(() {
      theme = value!;
    });
  }

  void onClickRed() {
    setState(() {
      appbar = Colors.red;
    });
  }

  void onClickOrange() {
    setState(() {
      appbar = Colors.amber;
    });
  }

  void onClickBlue() {
    setState(() {
      appbar = Colors.blue;
    });
  }

  void onClickGreen() {
    setState(() {
      appbar = Colors.lightGreen;
    });
  }

  void onClickRedAccent() {
    setState(() {
      appbar = Colors.redAccent;
    });
  }

  void onChangeAppBar(Color? value) {
    setState(() {
      appbar = value!;
    });
  }
}
