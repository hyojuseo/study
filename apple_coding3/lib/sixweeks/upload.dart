import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  Upload({Key? key, this.userImage, this.childData}) : super(key: key);
  final userImage;
  TextEditingController textEditingController = TextEditingController();
  final childData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
            ),
          ),
          //photofilters 로 필터 적용 가능
          Image.file(userImage),
          Text('이미지 업로드 화면'),
          IconButton(
              onPressed: () {
                childData({
                  'image': Image.file(userImage),
                  'likes': 5,
                  'user': 'hodu',
                  'content': 'hodu는 오늘도 맑음'
                });
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
      ),
    );
  }
}
