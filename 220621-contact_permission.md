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

compileSdkVersion yourCompileSdkVersion

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
        //더이상 팝업창이 뜨지않을때 직접 권한설정하라고 하기.
        openAppSettings();
    }
}
```

## 연락처 가져오기
- contacts_service: ^0.6.3 library add

```
var contacts = await ContactsService.getContacts();
name = contacts;
print(name[0].displayName);
```

## 연락처 추가하기
```
var newPerson = Contact();
newPerson.givenName = 'name';
ContactsService.addContact(newPerson);
```