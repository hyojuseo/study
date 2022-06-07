import 'package:flutter/material.dart';

class TextStyleEx extends StatelessWidget {
  const TextStyleEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱임'),
      ),
      body: SizedBox(
        child: Text(
          '안녕하세요',
          style: TextStyle(
            color: Colors.black, //Color.fromRGBO(20,20,20,0.8)
            //Color(0xffffffff)
            fontSize: 30,
            backgroundColor: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
