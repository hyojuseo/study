import 'package:apple_coding3/twoweeks/float_dialog.dart';
import 'package:flutter/material.dart';

class AlertHomework extends StatefulWidget {
  const AlertHomework({Key? key}) : super(key: key);

  @override
  State<AlertHomework> createState() => _AlertHomeworkState();
}

class _AlertHomeworkState extends State<AlertHomework> {
  var a = 0;

  addOne(){
    setState((){
      a++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(a.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return FloatDialog(state: a, addOne: addOne,);
              });
        },
        child: Text('+'),
      ),
    );
  }
}

