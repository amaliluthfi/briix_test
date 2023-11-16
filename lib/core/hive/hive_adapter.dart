import 'dart:io';

import 'package:briix_test/module/home/models/movie_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveAdapters {
  static init() async {
    Directory? docPath;
    if (!kIsWeb) {
      docPath = await path_provider.getApplicationDocumentsDirectory();
    }
    Hive.init(docPath?.path ?? "briix");
    Hive.registerAdapter(MovieModelAdapter());
    if (!Hive.isBoxOpen("movieBox")) {
      await Hive.openBox<MovieModel>("movieBox");
    }
  }
}
