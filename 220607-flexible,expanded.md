### 비율주는 Flexible 위젯
- 폭을 얼마나 차지할지 결정하는 '배수' 이다.
```
Row(
  children: [
    Flexible(child: Container(color: Colors.blue), flex: 1),
    Flexible(child: Container(color: Colors.green), flex: 1),
  ]
)
```
<br>

### 하나의 박스만 폭을 꽉 채우는 Expanded 위젯
 - flex: 1가진 Flexible 박스와 같다.
```
Row(
    children: [
        Expanded(child: Container(color: Colors.blue), flex: 1),
        Container(color:Colors.green, width:100),
    ]
)
```