import 'package:flutter/material.dart';

class AnswerHomework2 extends StatelessWidget {
  AnswerHomework2({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(a);
          a++;
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                Icons.account_circle_sharp,
                size: 50,
                color: Colors.black,
              ),
              title: Text('홍길동'),
            );
          }),
    );
  }
}
