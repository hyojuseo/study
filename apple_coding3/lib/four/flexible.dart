import 'package:flutter/material.dart';

class FlexibleEx extends StatelessWidget {
  const FlexibleEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Flexible(child: Container(color: Colors.blue,), flex: 1),
          Flexible(child: Container(color: Colors.green,), flex: 2),
        ],
      ),
    );
  }
}
