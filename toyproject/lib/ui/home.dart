import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyproject/ui/delivery_page.dart';
import 'package:toyproject/ui/mypage.dart';

import '../controller/bottom_controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: BottomController.to.pageIndex.toInt());
  }

  Widget _page() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          BottomController.to.pageIndex = index.obs;
        });
      },
      children: const [
        Delivery(),
        MyPage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BottomController.to.willPopAction,

      child: Obx(
        () => Scaffold(
            resizeToAvoidBottomInset: false,
            body: _page(),
            bottomNavigationBar: BottomNavigationBar(
              //현재페이지 index
              currentIndex: BottomController.to.pageIndex.toInt(),
              //선택된 item color
              selectedItemColor: Colors.white54,
              //선택됐을때 아이콘이 올라오는것 방지
              type: BottomNavigationBarType.fixed,
              //선택되지않았을때 라벨상태
              showUnselectedLabels: false,
              //선택됐을때 라벨상태
              showSelectedLabels: false,
              backgroundColor: Colors.brown,
              //현재index 변경
              onTap: (int updatedIndex) {
                setState(() {
                  BottomController.to.pageIndex = updatedIndex.obs;
                  //bottomIndex가 변하면 pageViewIndex도 같이 변화해야 된다.
                  pageController!
                      .jumpToPage(BottomController.to.pageIndex.toInt());
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'Delivery'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'myPage'),
              ],
            )),
      ),
    );
  }
}
