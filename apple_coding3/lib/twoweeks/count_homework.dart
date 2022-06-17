import 'package:flutter/material.dart';

class CountHomework extends StatefulWidget {
  const CountHomework({Key? key}) : super(key: key);

  @override
  State<CountHomework> createState() => _CountHomeworkState();
}

class _CountHomeworkState extends State<CountHomework> {
  var a = [0, 0, 0];
  var name = ['김영숙', '홍길동', '피자집'];

  Widget _list() {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(a[index].toString()),
                    SizedBox(width: 20),
                    Text(name[index]),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        a[index]++;
                      });
                    },
                    child: Text('좋아요')),
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
        child: Text('+'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Alert!!'),
                  content: Text('Are you sure?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'))
                  ],
                );
              });
        },
      ),
    );
  }
}
