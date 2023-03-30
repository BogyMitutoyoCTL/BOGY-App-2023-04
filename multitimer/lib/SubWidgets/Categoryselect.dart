import 'package:flutter/material.dart';
import 'package:multitimer/data/Category.dart';
import 'package:multitimer/data/Data.dart';

class Categoyselect extends StatefulWidget {
  Data data;

  Categoyselect(Data this.data, {super.key});

  @override
  State<Categoyselect> createState() => _CategoyselectState();
}

class _CategoyselectState extends State<Categoyselect> {
  Category dropdownValue = Category();

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green, ////Muss verändert werden!!!
      child: DropdownButton<Category>(
        hint: Text("", style: Theme.of(context).textTheme.labelSmall),
        value: dropdownValue,
        // dropdownColor: Colors.green, ////Muss verändert werden!!!
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        icon: Icon(Icons.arrow_downward),
        style: Theme.of(context).textTheme.labelSmall,
        onChanged: (Category? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: widget.data.categories
            .map<DropdownMenuItem<Category>>((Category value) {
          return DropdownMenuItem<Category>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
      ),
    );
  }
}
