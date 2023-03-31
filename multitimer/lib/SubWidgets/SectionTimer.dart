import 'package:flutter/material.dart';
import 'package:multitimer/data/SectionTimerData.dart';

class SectionTimer extends StatefulWidget {
  SectionTimerData data;

  SectionTimer(SectionTimerData this.data, {Key? key}) : super(key: key);

  @override
  State<SectionTimer> createState() => _SectionTimerState();
}

class _SectionTimerState extends State<SectionTimer> {
  @override
  Widget build(BuildContext context) {
    List<Widget> Texte = [Text("hi")];
    return Column(
      children: Texte,
    );
  }
}
