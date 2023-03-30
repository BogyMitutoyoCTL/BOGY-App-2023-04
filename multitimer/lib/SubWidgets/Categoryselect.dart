import 'package:flutter/material.dart';
import 'package:multitimer/data/CategorySelectData.dart';
import 'package:multitimer/data/TimerCategory.dart';

class Categoyselect extends StatefulWidget {
  CategorySelectData data;

  Categoyselect(this.data, {super.key});

  @override
  State<Categoyselect> createState() => _CategoyselectState();
}

class _CategoyselectState extends State<Categoyselect> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<TimerCategory>> menuitems = [];
    for (var cat in widget.data.categories) {
      menuitems.add(DropdownMenuItem<TimerCategory>(
        value: cat,
        child: Text(cat.name),
      ));
    }

    return DropdownButton<TimerCategory>(
      hint: Text("Kategorie wählen", style: Theme.of(context).textTheme.labelSmall),
      value: widget.data.selectedCategory,
      // borderRadius: BorderRadius.all(Radius.circular(15.0)),
      icon: Icon(Icons.arrow_downward),
      style: Theme.of(context).textTheme.labelSmall,
      onChanged: changeCategory,
      items: menuitems,
    );
  }

  void changeCategory(TimerCategory? value) {
    setState(() {
      debugPrint(value!.name);
      widget.data.selectedCategory = value;
    });
  }
}
