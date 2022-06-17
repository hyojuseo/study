import 'package:apple_coding3/twoweeks/float_dialog.dart';
import 'package:flutter/material.dart';

class AddPeopleHomework extends StatefulWidget {
  const AddPeopleHomework({Key? key}) : super(key: key);

  @override
  State<AddPeopleHomework> createState() => _AddPeopleHomeworkState();
}

class _AddPeopleHomeworkState extends State<AddPeopleHomework> {
  var name = ['김영숙', '홍길동', '피자집'];

  addOne(var inputData){
    setState((){
      name.add(inputData);
    });
  }

  Widget _list() {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.account_circle, size: 40,),
                    SizedBox(width: 20),
                    Text(name[index], style: TextStyle(fontSize: 20),),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return FloatDialog(addOne: addOne,);
              });
        },
        child: Text('+'),
      ),
    );
  }
}
