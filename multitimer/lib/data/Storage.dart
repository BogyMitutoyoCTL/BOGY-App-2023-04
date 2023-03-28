import 'dart:convert';
import 'dart:io';

import 'Data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'Group.dart';
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
      var data = new Data();
      var kochen = new Group(name: "Kochen");
      data.groups.add(kochen);

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

      data.groups.add(new Group(name: "Sport"));

      return data;
    }

    File file = await _getDataFile();
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      Map<String, dynamic> json = jsonDecode(jsonString);
      var data = Data.fromJson(json);
      return data;
    } else {
      return new Data();
    }
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
