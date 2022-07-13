import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(count.toString()),
          ElevatedButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              child: Text('+'))
        ],
      ),
    );
  }
}
