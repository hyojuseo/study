import 'package:flutter/material.dart';

class ContainerDesign extends StatelessWidget {
  const ContainerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('앱임'),),
      body: Container(
        width: 50, height: 50, color: Colors.blue,
        margin: EdgeInsets.all(50),
      ),
    );
  }
}
