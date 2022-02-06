import 'package:flutter/material.dart';
import 'package:rxdart_example/rxdart_example.dart';

import 'di/di.dart';

void main() async {
  configureDependencies();
  runApp(const RxDartApp());
}
