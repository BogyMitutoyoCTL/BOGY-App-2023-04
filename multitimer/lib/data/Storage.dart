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
      data.groups.add(new Group(name: "Kochen"));
      data.groups[0].timers.add(new Timer(name: "Nudeln"));
      data.groups[0].timers[0].sections
          .add(new Section(message: "Wasser erhitzen"));
      data.groups[0].timers[0].sections[0].duration = new Duration(minutes: 2);
      data.groups[0].timers[0].sections
          .add(new Section(message: "Nudeln kochen"));
      data.groups[0].timers[0].sections[1].duration = new Duration(minutes: 8);
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
