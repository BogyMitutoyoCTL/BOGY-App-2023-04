import 'package:flutter/material.dart';

class ActiveTimers extends StatelessWidget {
  const ActiveTimers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Aktive Timer")),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Placeholder(),
        ],
      ),
    );
  }
}
