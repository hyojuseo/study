### ListView 위젯
- 쇼핑몰 상품목록
- SNS 피드
등에 ListView위젯이 사용된다.

#### 장점
- 무한 스크롤 가능
- 데이터만 있으면 자동으로 반복문 돌려준다.
- 지나간 목록은 삭제하기 때문에 메모리 절약

---

### ListView 기본 사용법
```
ListView(
    children: [
        ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text('홍길동'),
        ),
    ]
)
```
<br>

### 목록을 동적으로 만드는 ListView.builder()
```
ListView.builder(
    itemCount: 5,   //리스트 갯수
    itemBuilder: (context, index){
        return Text('안녕');    //반복할 위젯
    }
)
```
<br>

### FloatingActionButton
- 하단에 공중에 뜬 버튼이다.
- FAB라고 줄여서 많이 부른다.
```
MaterialApp(
    home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text('버튼')
            onPressed: (){}
        ),
        appBar: AppBar(),
        ...
    )
)
```