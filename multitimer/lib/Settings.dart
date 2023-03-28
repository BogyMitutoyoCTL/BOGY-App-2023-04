import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var theme = 2;
  Color color = Colors.black87;
  Color textcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: new Text("Settings")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                new Text(
                  "Change the theme of the App:",
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
                  value: 1,
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
                Radio(value: 2, groupValue: theme, onChanged: onClickedRadio),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  child: Container(
                    color: color,
                    child: Text(
                      "Donate to the devs",
                      style: TextStyle(color: textcolor, fontFamily: 'Shyler'),
                    ),
                  ),
                  onPressed: onClickDonate,
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
      theme = 1;
      color = Colors.grey;
      textcolor = Colors.black87;
    });
  }

  void onClickBlack() {
    setState(() {
      theme = 2;
      color = Colors.black87;
      textcolor = Colors.white;
    });
  }

  void onClickDonate() {}

  void onClickedRadio(int? value) {
    setState(() {
      theme = value!;
    });
  }
}
