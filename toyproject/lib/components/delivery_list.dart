import 'package:flutter/material.dart';

class DeliveryList extends StatefulWidget {
  DeliveryList({Key? key, this.state}) : super(key: key);
  final String? state;

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffDDDDDD),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ]),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //상품정보
          const Text('알루미늄캔 500ml 1박스...'),
          Row(
            children: const [
              //상품가격
              Text('68,800원'),
              //갯수
              Text('(2개)'),
            ],
          ),
          Row(
            children: [
              //배송현황
              Text(widget.state!),
              const Text(' / '),
              //운송장번호
              const Text('20220000111110000'),
            ],
          ),
          Row(
            children: const [
              //주문자
              Text('홍길동', style: TextStyle(color: Colors.brown)),
              //아이디
              Text('(hongg*****)', style: TextStyle(color: Colors.brown)),
              Text(' / ', style: TextStyle(color: Colors.brown)),
              //수취인
              Text('홍길동', style: TextStyle(color: Colors.brown)),
              Text(' / ', style: TextStyle(color: Colors.brown)),
              //주문일자
              Text('2022.06.11', style: TextStyle(color: Colors.brown)),
            ],
          )
        ],
      ),
    );
  }
}
