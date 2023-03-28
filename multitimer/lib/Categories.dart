import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

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
                child: Column(
                  children: [
                    CategoryWidget(),
                    CategoryWidget(),
                    CategoryWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClickAdd() {}
}

///////////////////////////////////////////////////////////////////////////

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  //
  final myController = TextEditingController();
  void _printLatestValue() {
    print('Text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  //
  var categName = "New Category";
  Color categColor = Colors.red;
  bool textfieldEnabled = false;
  //
  @override
  Widget build(BuildContext context) {
    Container container;
    if (textfieldEnabled == true) {
      container = Container(
        width: 200,
        child: TextField(
          controller: myController,
          maxLines: 1,
          maxLength: 20,
          showCursor: true,
          enabled: textfieldEnabled,
        ),
      );
    }
    ////
    else {
      container = Container(
        width: 200,
        child: Text(myController.text),
      );
    }
    /////
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: categColor,
                ),
                onPressed: onCategoryPress,
                child: Row(children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: container),
                  IconButton(
                    onPressed: onClickNameChange,
                    icon: Icon(Icons.edit),
                    splashRadius: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: onClickDeleteCategory,
                      icon: Icon(Icons.delete_forever),
                      splashRadius: 15,
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  void onClickNameChange() {
    setState(() {
      textfieldEnabled = !textfieldEnabled;
    });
  }

  void onClickDeleteCategory() {}

  void onCategoryPress() {}
}
