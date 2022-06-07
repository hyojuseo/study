import 'package:flutter/material.dart';

class LayoutHomework2 extends StatelessWidget {
  const LayoutHomework2({Key? key}) : super(key: key);

  Widget _listItem(){
    return Row(
      children: const[
        Icon(
          Icons.account_circle_sharp,
          size: 50,
        ),
        SizedBox(width: 10),
        Text('홍길동'),
      ],
    );
  }

  Widget _listView() {
    return ListView(
      children: [
        _listItem(),
        _listItem(),
        _listItem(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱제목'),
      ),
      body: _listView(),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          ),
        ),
      ),
    );
  }
}
