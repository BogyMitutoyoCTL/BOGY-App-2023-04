import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var ersterAbschnitt = new Text("Erster Abschnitt");

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
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: Column(
                        children: [
                          new Text(AppLocalizations.of(context)!.cookn),
                          new Text("1.)", textScaleFactor: 0.75),
                        ],
                      ),
                    ),
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
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.play_arrow),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.edit),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 49,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.trash),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
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
                      child: Column(
                        children: [
                          new Text(AppLocalizations.of(context)!.cooke),
                          new Text("1.)", textScaleFactor: 0.75)
                        ],
                      ),
                    ),
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
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.play_arrow),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.edit),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 49,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.trash),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
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
                      child: Column(
                        children: [
                          new Text(AppLocalizations.of(context)!.cookr),
                          new Text("1.)", textScaleFactor: 0.75)
                        ],
                      ),
                    ),
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
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.play_arrow),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.edit),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 49,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.trash),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
