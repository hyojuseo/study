import 'package:flutter/material.dart';

TextStyle _greyStyle(){
  return TextStyle(fontSize: 10, color: Colors.grey);
}

class LayoutHomework extends StatelessWidget {
  const LayoutHomework({Key? key}) : super(key: key);

  Widget _image() {
    return Image.asset('assets/apple.jpg');
  }

  Widget _explain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('캐논 DSLR 100D (단렌즈, \n충전기 16기가SD 포함)'),
        SizedBox(height: 5),
        Text('성동구 행당동 . 끌올 10분 전', style: _greyStyle()),
        SizedBox(height: 5),
        Text('210,000원', style: TextStyle(fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.favorite),
            Text('4', style: TextStyle(color: Colors.grey)),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              '금호동3가',
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          Row(
            children: const [
              Icon(Icons.search, color: Colors.black, size: 30),
              SizedBox(width: 15),
              Icon(Icons.menu, color: Colors.black, size: 30),
              SizedBox(width: 15),
              Icon(Icons.add_alert_outlined, color: Colors.black, size: 30),
              SizedBox(width: 15),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        // padding: EdgeInsets.all(20),
        height: 150,
        child: Row(
          children: [
            _image(),
            SizedBox(width: 15),
            Expanded(child: _explain()),
          ],
        ),
      ),
    );
  }
}
