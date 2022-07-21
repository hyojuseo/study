# CastingError
- 해당 값이 일부 버전이 아니면 casting이 실패하는 것이다.
<br>

```
var chatType = ChatData().questions[0]['response']['type']
```
위 코드에서 null chek error message가 띄워진다. 
![error](https://user-images.githubusercontent.com/90611410/180164446-065459ba-fe53-417a-8ec7-c52a316b9fe4.PNG)


ChatData().questions[0]['response']의 값이 일부 버전이 아니기 때문에 Map casting에 실패하는 것이다.

그래서 ChatData().questions[0]['response'] as Map으로 변경하여
(ChatData().question[0]['response'] as Map)['type']으로 값이 잘 불러와진다. 
<br>

- 참고
https://stackoverflow.com/questions/60245865/the-operator-isnt-defined-for-the-class-object-dart
