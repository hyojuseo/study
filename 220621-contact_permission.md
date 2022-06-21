## getPermission
> 안드로이드 11이상/ IOS 환경에선 2번이상 거절하게 되면 다시는 팝업창이 뜨지 않는다.(정책상)

### 연락처 권한 받기
- pubspec.yaml
```
dependencies:
    flutter:
        sdk: flutter
    permission_handler: 'version'
```

<br>

compileSdkVersion yourCompileSdkVersion

<br>

- android/app/src/main/ANdroidManifest.xml
```
<manifest> ...
    <uses-permission android:name="android.permission.READ_CONTACTS"/>
    <uses-permission android:name="android.permission.WRITE_CONTACTS"/>
    
    <application>....
```

- main.dart
```
getPermission() async{
    var status = await Permission.contacts.status;
    if(status.isGranted){
        print('allow');
    } else if(status.isDenied){
        print('deny');
        Permission.contacts.request();
    }
}
```