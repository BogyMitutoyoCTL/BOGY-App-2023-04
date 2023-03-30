import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/data/Data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Settings extends StatefulWidget {
  Data data;

  Settings(this.data, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState(data);
}

class _SettingsState extends State<Settings> {
  ThemeMode theme = ThemeMode.light;
  Color textcolor = Colors.white;

  Data data;

  _SettingsState(Data this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                AppLocalizations.of(context)!.settings,
              ),
            ),
            Icon(Icons.settings),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(AppLocalizations.of(context)!.changetheme),
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
                  groupValue: data.theme,
                  onChanged: setTheme,
                ),
                ElevatedButton(
                  onPressed: onClickWhite,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                  ),
                  child: Container(
                    height: 90,
                    width: 60,
                  ),
                ),
                Container(
                  height: 3,
                  width: 90,
                ),
                Radio(
                    value: ThemeMode.dark,
                    groupValue: data.theme,
                    onChanged: setTheme),
                ElevatedButton(
                  onPressed: onClickBlack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                  ),
                  child: Container(
                    height: 90,
                    width: 60,
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
                      groupValue: data.appBarColor,
                      onChanged: setAppBarColor),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: onClickRed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(AppLocalizations.of(context)!.red),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.amber,
                      groupValue: data.appBarColor,
                      onChanged: setAppBarColor),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: onClickOrange,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: Text(AppLocalizations.of(context)!.orange),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.blue,
                      groupValue: data.appBarColor,
                      onChanged: setAppBarColor),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: onClickBlue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(AppLocalizations.of(context)!.blue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.lightGreen,
                      groupValue: data.appBarColor,
                      onChanged: setAppBarColor),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: onClickGreen,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      child: Text(AppLocalizations.of(context)!.green),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: Colors.redAccent,
                      groupValue: data.appBarColor,
                      onChanged: setAppBarColor),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: onClickRedAccent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Text(AppLocalizations.of(context)!.redaccent),
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
                    color: Colors.white,
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
    setTheme(ThemeMode.light);
  }

  void onClickBlack() {
    setTheme(ThemeMode.dark);
  }

  void onClickDonate() {
    launchUrlString('https://www.paypal.com/myaccount/summary');
  }

  void setTheme(ThemeMode? value) {
    setState(() {
      data.theme = value!;
      data.themeChanger.value = data.theme;
    });
  }

  void setValue(ThemeMode? value) {
    setState(() {
      value = data.theme;
    });
  }

  void onClickRed() {
    setAppBarColor(Colors.red);
  }

  void onClickOrange() {
    setAppBarColor(Colors.amber);
  }

  void onClickBlue() {
    setAppBarColor(Colors.blue);
  }

  void onClickGreen() {
    setAppBarColor(Colors.lightGreen);
  }

  void onClickRedAccent() {
    setAppBarColor(Colors.redAccent);
  }

  void setAppBarColor(Color? value) {
    setState(() {
      data.appBarColor = value!;
      data.appBarColorChanger.value = data.appBarColor;
    });
  }
}
