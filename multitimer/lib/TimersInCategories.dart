import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimersInCategories extends StatefulWidget {
  const TimersInCategories({Key? key}) : super(key: key);

  @override
  State<TimersInCategories> createState() => _TimersInCategoriesState();
}

class _TimersInCategoriesState extends State<TimersInCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(AppLocalizations.of(context)!.cook)),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            //Nudeln kochen
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                new Container(
                  width: 290,
                  height: 145,
                  color: Colors.yellow,
                  child: Center(
                      child: new Text(AppLocalizations.of(context)!.cookn)),
                ),
                new Container(
                  width: 1,
                  height: 145,
                  color: Colors.black,
                ),
                new Container(
                  width: 100,
                  height: 145,
                  color: Colors.yellow,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(CupertinoIcons.trash),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
          Padding(
            //Eier kochen
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                new Container(
                  width: 290,
                  height: 145,
                  color: Colors.yellow,
                  child: Center(
                      child: new Text(AppLocalizations.of(context)!.cooke)),
                ),
                new Container(
                  width: 1,
                  height: 145,
                  color: Colors.black,
                ),
                new Container(
                  width: 100,
                  height: 145,
                  color: Colors.yellow,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(CupertinoIcons.trash),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
          Padding(
            //Brötchen aufbacken
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                new Container(
                  width: 290,
                  height: 145,
                  color: Colors.yellow,
                  child: Center(
                      child: new Text(AppLocalizations.of(context)!.cookr)),
                ),
                new Container(
                  width: 1,
                  height: 145,
                  color: Colors.black,
                ),
                new Container(
                  width: 100,
                  height: 145,
                  color: Colors.yellow,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(CupertinoIcons.trash),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
