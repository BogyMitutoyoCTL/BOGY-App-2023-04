import 'package:flutter/material.dart';
import 'package:multitimer/SubWidgets/CategWidget.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Categories")),
      body: Column(
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
    );
  }

  void onClickAdd() {
    setState(() {
      extractedChildren.add(CategoryWidget());
    });
  }

  List<Widget> extractedChildren = <Widget>[];
}
