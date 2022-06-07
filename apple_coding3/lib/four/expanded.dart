import 'package:flutter/material.dart';

class ExpandedEx extends StatelessWidget {
  const ExpandedEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.blue)),
          Container(width: 100, color: Colors.orange),
        ],
      ),
    );
  }
}
