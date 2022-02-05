import 'package:flutter/material.dart';
import 'package:rxdart_example/pages/main_page/main_page.dart';

class RxDartApp extends StatelessWidget {
  const RxDartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
