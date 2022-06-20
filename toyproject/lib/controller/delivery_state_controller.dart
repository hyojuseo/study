import 'package:get/get.dart';

class DeliveryStateController extends GetxController{
  static DeliveryStateController get to => Get.find();
  String selectMenu = '';

  final Map<String, bool> isDeliveryState = {
    '주문' : false,
    '입금' : false,
    '준비' : false,
    '배송' : false,
    '배송완료' : false,
  };

  updatedState(){
    update();
  }
}