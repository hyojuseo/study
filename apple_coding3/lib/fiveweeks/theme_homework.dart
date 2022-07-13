import 'dart:io';

import 'package:apple_coding3/sixweeks/upload.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart'; //스크롤관련 유용한 함수들

class ThemeHomework extends StatefulWidget {
  const ThemeHomework({Key? key}) : super(key: key);

  @override
  State<ThemeHomework> createState() => _ThemeHomeworkState();
}

class _ThemeHomeworkState extends State<ThemeHomework> {
  var currentIndex = 0;
  Future<List>? post;
  List postData = [];
  var scroll = ScrollController();
  var userImage;

  @override
  void initState() {
    super.initState();
    post = getData();
    scroll.addListener(() {
      //scroll이 변할때마다 실행된다.
      //필요없어지면 제거하는것도 성능상 좋다.
      print(scroll.position.pixels);
      print(scroll.position.maxScrollExtent); // 스크롤바 최대 내릴 수 있는 높이
      print(scroll.position.userScrollDirection); //스크롤 되는 방향
      //아래로 스크롤하면 ScrollDirection.reverse
      //위로 스크롤하면 ScrollDirection.forward
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        setState(() {
          addData();
        });
      }
    });
  }

  Future<List<dynamic>> getData() async {
    var response = await http //future를 뱉음
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if (response.statusCode == 200) {
      //성공시 실행할 코드
      var result = jsonDecode(response.body);
      // postData.add(result);
      postData = result;
      return postData;
    } else {
      print('error1');
      return postData;
      //실패시 실행할 코드
    }
  }

  Future<List<dynamic>> addData() async {
    var response = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      postData.add(result);
      return postData;
    } else {
      print('error2');
      return [];
    }
  }

  childData(var data) {
    setState(() {
      postData.insert(0, data); //[{},{}] 구조
    });
  }


  Widget _list(List data) {
    return ListView.builder(
        controller: scroll,
        itemCount: postData.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                '${data[index]['image']}',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '좋아요 ${data[index]['likes'].toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(data[index]['user'].toString()),
                    Text(data[index]['content'].toString()),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('?');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, size: 30),
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                //setState(() {
                userImage = File(image.path);
                //});
              }
              //선택한 이미지를 위젯에 보여주기

              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Upload(
                            userImage: userImage,
                            childData: childData,
                          )));
            },
          )
        ],
      ),
      body: FutureBuilder<List>(
        future: post,
        builder: (context, snapshot) {
          List posts = snapshot.data ?? [];

          if (snapshot.hasData) {
            return _list(posts);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'shopping')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
