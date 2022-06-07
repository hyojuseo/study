import 'package:flutter/material.dart';

class AppBarEx extends StatelessWidget {
  const AppBarEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('앱임'),
        actions: const[
          Icon(Icons.call),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }
}
