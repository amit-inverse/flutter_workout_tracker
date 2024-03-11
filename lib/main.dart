import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/app.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a hive box
  await Hive.openBox('workout_database');

  runApp(const App());
}
