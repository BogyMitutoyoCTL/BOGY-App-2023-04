import 'package:flutter/material.dart';
import 'package:multitimer/data/Data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Settings extends StatefulWidget {
  Data data;

  Settings(Data this.data, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState(data);
}

class _SettingsState extends State<Settings> {
  var theme = 2;
  var appb = 5;
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
                "Settings",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(value: 3, groupValue: appb, onChanged: onClickedRadio),
                  ElevatedButton(
                    onPressed: onClickRed,
                    child: Text("Red"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(value: 4, groupValue: appb, onChanged: onClickedRadio),
                  ElevatedButton(
                    onPressed: onClickOrange,
                    child: Text("Orange"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(value: 5, groupValue: appb, onChanged: onClickedRadio),
                  ElevatedButton(
                    onPressed: onClickBlue,
                    child: Text("Blue"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(value: 6, groupValue: appb, onChanged: onClickedRadio),
                  ElevatedButton(
                    onPressed: onClickGreen,
                    child: Text("Green"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(value: 7, groupValue: appb, onChanged: onClickedRadio),
                  ElevatedButton(
                    onPressed: onClickRedAccent,
                    child: Text("Red Accent"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
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
                  child: Container(
                    color: textcolor,
                    child: Text(
                      "Donate to the devs",
                      style: TextStyle(
                          color: Colors.blue[800], fontFamily: 'Shyler'),
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

  void onClickDonate() {
    launchUrlString('https://www.paypal.com/myaccount/summary');
  }

  void onClickedRadio(int? value) {}

  void onClickRed() {
    setState(() {
      appb = 3;
      appbar = Colors.red;
    });
  }

  void onClickOrange() {
    setState(() {
      appb = 4;
      appbar = Colors.amber;
    });
  }

  void onClickBlue() {
    setState(() {
      appb = 5;
      appbar = Colors.blue;
    });
  }

  void onClickGreen() {
    setState(() {
      appb = 6;
      appbar = Colors.lightGreen;
    });
  }

  void onClickRedAccent() {
    setState(() {
      appb = 7;
      appbar = Colors.red[400]!;
    });
  }
}
