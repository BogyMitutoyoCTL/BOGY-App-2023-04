import 'package:flutter/material.dart';
import 'package:multitimer/data/TimerCategory.dart';
import 'package:multitimer/data/Data.dart';

class Categoyselect extends StatefulWidget {
  Data data;

  Categoyselect(Data this.data, {super.key});

  @override
  State<Categoyselect> createState() => _CategoyselectState();
}

class _CategoyselectState extends State<Categoyselect> {
  TimerCategory? dropdownValue = null;

  @override
  Widget build(BuildContext context) {
    if (dropdownValue == null) dropdownValue = widget.data.categories.first;
    return Container(
      //color: Colors.green, ////Muss verändert werden!!!
      child: DropdownButton<TimerCategory>(
        hint: Text("", style: Theme.of(context).textTheme.labelSmall),
        value: dropdownValue,
        // dropdownColor: Colors.green, ////Muss verändert werden!!!
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        icon: Icon(Icons.arrow_downward),
        style: Theme.of(context).textTheme.labelSmall,
        onChanged: (TimerCategory? value) {
          // This is called when the user selects an item.
          setState(() {
            debugPrint(value!.name);
            dropdownValue = value;
          });
        },
        items: widget.data.categories
            .map<DropdownMenuItem<TimerCategory>>((TimerCategory value) {
          return DropdownMenuItem<TimerCategory>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
      ),
    );
  }
}
