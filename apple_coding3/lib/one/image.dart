import 'package:flutter/material.dart';

class ImageEx extends StatelessWidget {
  const ImageEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/cat.jpeg');
  }
}
