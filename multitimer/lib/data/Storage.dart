import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';

import 'Data.dart';
import 'Section.dart';
import 'Timer.dart';
import 'TimerCategory.dart';

class Storage {
  Future<void> save(Data data) async {
    if (kIsWeb) {
      // for web projects, storage via dart:io is not available
      return;
    }

    File file = await _getDataFile();
    var json = jsonEncode(data);
    await file.writeAsString(json);

    print("Data saved: $json");
  }

  Future<Data> load() async {
    if (kIsWeb) {
      // for web projects, storage via dart:io is not available
      return _createDemoData();
    }

    File file = await _getDataFile();
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      Map<String, dynamic> json = jsonDecode(jsonString);
      var data = Data.fromJson(json);
      return data;
    } else {
      return _createDemoData();
    }
  }

  Data _createDemoData() {
    var data = new Data();
    var kochen = new TimerCategory(name: "Kochen");
    data.categories.add(kochen);
    var haushalt = new TimerCategory(name: "Haushalt");
    data.categories.add(haushalt);
    var sport = new TimerCategory(name: "Sport");
    data.categories.add(sport);

    var nudeltimer = new Timer(name: "Nudeln");
    var erhitzen = new Section(
        message: "Wasser erhitzen", duration: new Duration(minutes: 2));
    var nudelnkochen = new Section(
        message: "Nudeln kochen", duration: new Duration(minutes: 8));
    nudeltimer.sections.add(erhitzen);
    nudeltimer.sections.add(nudelnkochen);
    kochen.timers.add(nudeltimer);

    var broetchentimer = new Timer(name: "Brötchen backen");
    kochen.timers.add(broetchentimer);
    var backen =
        new Section(message: "backen", duration: new Duration(minutes: 10));
    broetchentimer.sections.add(backen);

    var laufband = new Timer(name: "Auf dem Laufband laufen");
    sport.timers.add(laufband);
    var laufen =
        new Section(message: "laufen", duration: new Duration(minutes: 45));
    laufband.sections.add(laufen);
    laufband.activate();
    laufband.expire();

    var waschmaschiene = new Timer(name: "Waschmaschine");
    haushalt.timers.add(waschmaschiene);
    var waschen = new Section(
        message: "Wäsche waschen", duration: new Duration(minutes: 120));
    waschmaschiene.sections.add(waschen);
    waschmaschiene.activate();

    var buegeleisen = new Timer(name: "Bügeleisen");
    kochen.timers.add(buegeleisen);
    var buegeln = new Section(
        message: "Wäsche bügeln", duration: new Duration(minutes: 30));
    buegeleisen.sections.add(buegeln);
    buegeleisen.activate();
    buegeleisen.expire();

    return data;
  }

  Future<File> _getDataFile() async {
    final String fileName = "multitimer";
    String path = (await _getMultiTimerDirectory()).path;
    final file = File('${path}/${fileName}.json');
    return file;
  }

  Future<Directory> _getMultiTimerDirectory() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    var directory = Directory("${appDocDir.path}/multitimer");
    _ensureDirectoryExists(directory);
    return directory;
  }

  void _ensureDirectoryExists(final Directory directory) async {
    if (!(await directory.exists())) {
      await directory.create(recursive: true);
    }
  }
}
