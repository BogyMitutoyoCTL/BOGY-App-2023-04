import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multitimer/SubWidgets/CategWidget.dart';
import 'package:multitimer/data/CategWidgetData.dart';
import 'package:multitimer/data/Data.dart';

import 'data/TimerCategory.dart';

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
    List<Widget> extractedChildren = [];

    for (int i = 0; i < widget.data.categories.length; i++) {
      var aCategory = widget.data.categories[i];
      var categWidgetData = CategWidgetData();
      categWidgetData.editEnabled = aCategory.name.isEmpty;
      categWidgetData.category = aCategory;
      categWidgetData.delete = deleteCateg;
      categWidgetData.color = widget.data.colorOf(aCategory);
      var categoryWidget = new CategoryWidget(categWidgetData);
      extractedChildren.add(categoryWidget);
    }

    return new Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Text(
            AppLocalizations.of(context)!.categories +
                ": " +
                widget.data.categories.length.toString(),
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
    if (widget.data.categories.length < 20) {
      setState(() {
        var category = new TimerCategory();
        widget.data.categories.add(category);
      });
    }
  }

  void deleteCateg(TimerCategory categoryWhole) {
    setState(() {
      widget.data.categories.remove(categoryWhole);
    });
  }
}

///////
