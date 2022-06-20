import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyproject/binding/init_binding.dart';
import 'package:toyproject/ui/home.dart';
import 'package:toyproject/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      //home: const LoginPage(),

      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(
          name: '/home',
          page: () => Home(),
          transition: Transition.rightToLeft,
        ),
      ],

      initialBinding: InitBinding(),
    );
  }
}
