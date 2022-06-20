import 'package:flutter/material.dart';
import 'package:toyproject/components/delivery_list.dart';
import 'package:toyproject/controller/delivery_state_controller.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final _searchList = ['주문자', '운송장번호'];
  var _selectedSearch = '주문자';
  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    print(DeliveryStateController.to.isDeliveryState);
    textEditingController = TextEditingController();
  }

  Widget _deliveryItem(String image, String text) {
    return GestureDetector(
      onTap: () {
        //이전에 선택된 탭이 모두 false 되도록 전체 value들을 false로 하고.
        //선택된 key의 value 에 true를 한다.
        DeliveryStateController.to.isDeliveryState.updateAll((key, value) =>
            DeliveryStateController.to.isDeliveryState[key] = false);

        setState(() {
          DeliveryStateController.to.selectMenu = text;
          DeliveryStateController.to.isDeliveryState[text] = true;
          DeliveryStateController.to.updatedState();
        });
      },
      child: Column(
        children: [
          Image.asset(
            '${image}${DeliveryStateController.to.isDeliveryState[text] ==
                false ? '_off.png' : '_on.png'}',
            color: DeliveryStateController.to.isDeliveryState[text] == false
                ? Colors.grey
                : Colors.brown,
          ),
          Text(
            text,
            style: TextStyle(
                color: DeliveryStateController.to.isDeliveryState[text] == false
                    ? Colors.grey
                    : Colors.brown,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: DropdownButton(
            borderRadius: BorderRadius.circular(20),
            //밑줄 없애기
            underline: const SizedBox.shrink(),
            value: _selectedSearch,
            items: _searchList.map((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedSearch = value as String;
              });
            },
          ),
        ),
        Expanded(
          child: TextField(
            controller: textEditingController,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: '검색할 내용을 입력하세요',
              contentPadding: EdgeInsets.all(5),
              isDense: true,
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }

  Widget _list() {
    return RefreshIndicator(
        onRefresh: () => Future(() => null),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            switch (DeliveryStateController.to.selectMenu) {
              case '주문':
                return DeliveryList(state: '결제완료');
              case '입금':
                return DeliveryList(state: '입금완료');
              case '준비':
                return DeliveryList(state: '준비중');
              case '배송':
                return DeliveryList(state: '배송중');
              case '배송완료':
                return DeliveryList(state: '배송완료');
            }
            return Container();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 가운데정렬
        centerTitle: true,
        title: const Text(
          '배송현황',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _deliveryItem('assets/icons8_buy', '주문'),
              _deliveryItem('assets/icons8_cash', '입금'),
              _deliveryItem('assets/icons8_packing', '준비'),
              _deliveryItem('assets/icons8_delivery', '배송'),
              _deliveryItem('assets/icons8_arrive', '배송완료'),
            ],
          ),
          _search(),
          Expanded(child: _list()),
        ],
      ),
    );
  }
}
