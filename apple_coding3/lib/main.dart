import 'package:apple_coding3/fiveweeks/theme_homework.dart';
import 'package:apple_coding3/week7/shared_preference.dart';
import 'package:flutter/material.dart';

void main() {
  // SharedEx().saveData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          elevation: 2
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SharedEx(),
    );
  }
}
