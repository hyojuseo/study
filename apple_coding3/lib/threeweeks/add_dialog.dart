import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  AddDialog({Key? key, this.addContact}) : super(key: key);
  var inputData = '';
  final addContact;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
          onChanged: (text){inputData = text;},
          decoration: InputDecoration(
              isDense: true)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              addContact(inputData);
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('ADD')),
      ],
    );
  }
}
