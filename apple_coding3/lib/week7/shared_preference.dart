import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedEx extends StatelessWidget {
  const SharedEx({Key? key}) : super(key: key);

  void saveData() async{
    //저장소 불러오기
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'hodu');
    var result = storage.getString('name');
    print(result);
    print('삭제후');
    print(storage.remove('name'));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
