import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';

import 'Category.dart';
import 'Data.dart';
import 'Section.dart';
import 'Timer.dart';

class Storage {
  Future<void> save(Data data) async {
    if (kIsWeb) {
      // for web projects, storage via dart:io is not available
      return;
    }

    File file = await _getDataFile();
    await file.writeAsString(jsonEncode(data));
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
    var kochen = new Category(name: "Kochen");
    data.categories.add(kochen);
    var haushalt = new Category(name: "Haushalt");
    data.categories.add(haushalt);

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

    data.categories.add(new Category(name: "Sport"));

    var waschmaschiene = new Timer(name: "Waschmaschine");
    haushalt.timers.add(waschmaschiene);
    var waschen = new Section(
        message: "Wäsche waschen", duration: new Duration(minutes: 120));
    waschmaschiene.sections.add(waschen);

    waschmaschiene.isExpired = false;
    waschmaschiene.isActive = true;

    var buegeleisen = new Timer(name: "Bügeleisen");
    kochen.timers.add(buegeleisen);
    var buegeln = new Section(
        message: "Wäsche bügeln", duration: new Duration(minutes: 30));
    buegeleisen.sections.add(buegeln);

    buegeleisen.isExpired = true;
    buegeleisen.isActive = false;

    return data;
  }

  Future<File> _getDataFile() async {
    final String fileName = "multitimer";
    final file = File('${_getMultiTimerDirectory()}/${fileName}.json');
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
