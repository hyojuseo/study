import 'package:flutter/material.dart';

class FloatDialog extends StatelessWidget {
  FloatDialog({Key? key, this.state, this.addOne}) : super(key: key);
  final state;
  final addOne;
  var inputData = TextEditingController();
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
          // controller: inputData,
        onChanged: (text){inputData2 = text;},
          decoration: InputDecoration(
              isDense: true,
              hintText: state.toString(),
              hintStyle: TextStyle(color: Colors.grey))),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              addOne(inputData2);
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('OK')),
      ],
    );
  }
}
