import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/SubWidgets/CategWidget.dart';
import 'package:multitimer/data/Data.dart';

import 'data/Category.dart';

class Categories extends StatefulWidget {
  Data data;

  Categories(Data this.data, {Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  _CategoriesState();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Text(
            AppLocalizations.of(context)!.categories +
                ": " +
                extractedChildren.length.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      )),
      body: ListView(
        primary: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        splashRadius: 30.0,
                        iconSize: 50,
                        onPressed: onClickAdd,
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Column(children: extractedChildren),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClickAdd() {
    if (extractedChildren.length < 20) {
      setState(() {
        var category = Category();
        extractedChildren.add(CategoryWidget(category, true));
      });
    }
  }

  void tellCategToDelete() {}

  List<Widget> extractedChildren = <Widget>[];
}

///////
