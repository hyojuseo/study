
import 'package:apple_coding3/twoweeks/add_people_homework.dart';
import 'package:apple_coding3/twoweeks/count_homework.dart';
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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CountHomework(),
    );
  }
}
