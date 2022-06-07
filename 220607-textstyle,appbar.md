### 글자에 스타일 넣기
 - backgroundColor
 - fontSize
 - fontWeight
 - fontFamily
 - letterSpacing //철자간의 간격 조절
 ```
 Text(
    '내용',
    style: TextStyle( color: Colors.red),
 )
 ```
 <br>

 ### 색상 넣는 법
1) 미리 정해진 색상표에서 고르는 방법
```
color: Colors.red
```
<br>

2) RGBO로 고르는 방법
```
color: Color.fromRGBO(20,20,20,0.8),
```
<br>

3) hex칼라로 고르는 방법(앞에 0xff 붙이는 것)
```
color: Color(0xffffffff)
```
<br>

### flutter에서 자주 쓰이는 버튼 3가지
1. TextButton(child:, onPressed:(){})
2. ElevatedButton(child:, onPressed:(){})
3. IconButton(child:, onPressed:(){})
<br>

### AppBar() 구성
![image](https://user-images.githubusercontent.com/90611410/172292000-5ea2aca4-ab06-4190-882c-ea5d64a5ed7f.png)

- leading: 제목왼쪽 아이콘
- title: 제목
- actions: 제목오른쪽 아이콘들