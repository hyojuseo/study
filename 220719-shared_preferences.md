# SharedPreferences
- 데이터를 내부적으로 저장하는 공간이다.
- 사용자가 앱 데이터 삭제를 누르지 않는 이상 영구적으로 남아있다.
- 웹 브라우저로 localStorage와 유사하다.
<br>

**[package 추가]**
https://pub.dev/packages/shared_preferences/install

![image](https://user-images.githubusercontent.com/90611410/180167309-0337da32-ec13-4f4c-bc50-3d408ca78e23.png)
<br>

### 데이터 저장
- List<int> 등은 예외로 List<String>으로 바꿔서 저장해야 된다.
```
saveData() async{
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'hodu');
    storage.setBool('name', true);
    storage.setInt('name',20);
    storage.setDouble('name', 20.5);
    storage.setStringList('name', ['hodu', 'john']);
}
```
<br>

### 데이터 출력
```
var result = storage.getString('name');
print(result);
```
<br>

### 데이터 삭제
- 'name'으로 저장한 자료가 삭제된다.
```
//storage.remove(자료명);
storage.remove('name');
```
<br>

### Map 데이터 저장
- Map 데이터는 문자로 변환하여 저장이 가능하다.
- jsonEncode()를 사용해 Map -> JSON으로 변환해준다.
```
storage.setString('map', jsonEncode({'age' : 20}));
```
<br>

### Map 데이터 출력
- JSON으로 저장하면 자료 출력도 JSON이다.
- JSON -> Map으로 변환하려면 jsonDecode()를 사용한다.
```
var result = storage.getString('map') ?? 'null입니다.';
print(jsonDecode(result));
print(jsonDecode(result)['age']);
```