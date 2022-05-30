import 'package:apple_coding3/one/container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//1. 앱 디자인 위젯 짜집기
//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContainerEx(),
    );
  }
}

