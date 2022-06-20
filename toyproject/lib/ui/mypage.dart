import 'package:flutter/material.dart';
import 'package:toyproject/ui/mypage/profile.dart';

ButtonStyle _elevatedStyle() {
  return ElevatedButton.styleFrom(
      primary: Colors.white.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10));
}

TextStyle _buttonTextStyle() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.brown.withOpacity(0.8));
}

Widget _elevatedButton(String text) {
  return ElevatedButton(
    onPressed: () {},
    style: _elevatedStyle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: _buttonTextStyle(),
        ),
        Icon(
          Icons.arrow_forward_sharp,
          color: Colors.brown.withOpacity(0.8),
        ),
      ],
    ),
  );
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  Widget _manage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('경기도 화성 지점', style: TextStyle(color: Colors.grey)),
          Divider(
            color: Colors.grey,
          ),
          //직급
          Text('총 책임자', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _list() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
      child: Column(
        children: [
          _elevatedButton('회원정보 수정'),
          const SizedBox(height: 10),
          _elevatedButton('회원관리'),
          const SizedBox(height: 10),
          _elevatedButton('설정'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 가운데정렬
        centerTitle: true,
        title: const Text(
          '내 정보',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          //프로필부분
          Container(
            height: 250,
            padding: const EdgeInsets.symmetric(vertical: 35),
            decoration: BoxDecoration(
              // color: Colors.brown.withOpacity(0.3),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown.withOpacity(0.5),
                  Colors.brown.withOpacity(0.3),
                  Colors.white,
                ]
              )
            ),
            child: const Profile(),
          ),
          //관리버튼들
          Padding(
            padding: const EdgeInsets.only(top: 185),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: _list(),
            ),
          ),
          //지점 및 직급
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 140),
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 0.8,
                      spreadRadius: 0,
                    ),
                  ]),
              child: _manage(),
            ),
          )
        ],
      ),
    );
  }
}
