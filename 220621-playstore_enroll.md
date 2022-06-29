## 스토어 등록
1. Android Studio 우측하단의 Project Structure를 눌러서 현재 사용하는 안드로이드 SDK 버전으로 바꿔준다.
<br>

2. 상단에서 Build -> Flutter -> Build APK 누르면 .apk 파일로 발행된다.(구글 플레이스토어에 등록하고 싶다면 키로 서명해서 .aab파일로 발행해야 된다.)
<br>

3. 21년 8월 이후 출시하는 앱들은 전부 키 파일이 있어야 된다. (터미널 오픈-> alt + f12 -> flutter doctor -v )
> Java binary at : G:\android studio\jre\bin\java
라고 Java binary라는 프로그램이 어딨는지 알려준다.

- 윈도우 
```
G:\"android studio"\jre\bin\keytool - genkey -v -keystore c:\flutter_key\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

- mac 
```
경로\keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

- 주의사항
키파일 저장하는 폴더안의 내용물이 전부 삭제되니, 반드시 새로운 폴더를 만들어서 그곳에 저장해야 된다.
<br><br>

4. 프로젝트에 android폴더 안에 key.properties라는 파일을 하나 만들어준다. 그리고 아래 내용을 복붙한다.
```
storePassword=아까입력한비번1
keyPassword=아까입력한비번2
keyAlias=upload
storeFile=키파일경로/upload-keystore.jks 
```
<br>

키파일 경로예시) c:/flutter_key/upload-keystore.jks 
<br><br>

5. android/app/build.gradle파일에 아래 코드를 추가한다.
```
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android { ....
```
<br><br>

6. 아래 코드를 android { 중괄호 안에 붙여준다. buildTypes { 이전
```
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
} 
```
<br><br>

7. buildTypes { 안의 코드를 변경해준다.
```
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
} 
```
<br><br>

8. Build - Flutter - Build App Bundle을 누르면 된다. build\app\outputs\bundle\release\app-release.aab 이런 경로에 나왔다고 알려주는데 이제 구글 플레이스토어에 등록하면 된다.
<br><br>

9. 하지만 구글플레이스토어에 올리려면 개발자 계정이 필요한데. 만들 때 25달러를 내야된다.(우선 비공개로 올려서 앱을 테스트 할 수도 있다.)