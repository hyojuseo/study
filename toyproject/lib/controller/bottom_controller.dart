import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyproject/components/message_popup.dart';

class BottomController extends GetxController {
  static BottomController get to => Get.find();
  RxInt pageIndex = 0.obs;

  Future<bool> willPopAction() async {
    if (true) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
        ),
      );
      return true;
    }
  }
}
