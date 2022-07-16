# ThemeData()안의 특정스타일 불러오기
- Theme.of()는 족보중 가장 가까운 ThemeData()를 찾아서 가져와주는 함수이다.
- 예로, bodyText1에 정의한 스타일을 꺼내올 수도 있다.
```
Text('hi', style: Theme.of(context).textTheme.bodyText1)
```