import 'dart:convert';
import 'dart:io';

import 'package:multitimer/data/Data.dart';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<void> save(Data data) async {
    File file = await _getDataFile();
    await file.writeAsString(jsonEncode(data));
  }

  Future<Data> load() async {
    File file = await _getDataFile();
    String jsonString = await file.readAsString();
    // TODO: convert JSON to data
    var data = new Data();
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
