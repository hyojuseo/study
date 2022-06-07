import 'package:flutter/material.dart';

class ButtonEx extends StatelessWidget {
  const ButtonEx({Key? key}) : super(key: key);

  Widget _textButton() {
    return TextButton(
      child: Text('TextButton'),
      onPressed: () {},
    );
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(),
      child: Text('ElevatedButton'),
    );
  }

  Widget _iconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.star),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱임'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: _textButton(),
          ),
          SizedBox(
            child: _elevatedButton(),
          ),
          SizedBox(
            child: _iconButton(),
          ),
        ],
      ),
    );
  }
}
