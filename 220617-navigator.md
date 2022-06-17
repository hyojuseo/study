# Navigator.pop(context); vs Navigator.of(context).pop(); 차이

- 두 함수의 기능차이는 없다.
- Navigator.pop(context)가 내부적으로 Navigator.of(context).pop()을 호출하는 구조를 가진다.
- Navigator.of(context).pop()은 가장 떨어져있는 context를 불러올 수 있다. 그러므로 예외상황을 제외하고는 Navigator.pop(context)를 사용하는 것이 낫다.
- 예외상황) showDialog()에 의해 생성된 route가 root navigator에 의해 push되는 상황이다. 이런 상황은 앱이 mutiple Navigator objects를 가지게 될 수 있기 때문에 Navigator.of(context,rootNavigator:true).pop()를 이용해 dialog를 정확하게 close해주는 것이 낫다.
- rootNavigator: true는 가장 먼 NavigatorState를 불러온다는 것이다. 만일 Getx를 사용한다면 Get.back()함수를 호출하면된다.
- push에서도 위와 동일하다.

## Route의 개념
> 하나의 화면, 페이지이다.


## Navigator의 개념
> 모든 앱 페이지를 관리하며, stack이라는 자료구조 형식으로 라우터의 객체들을 관리한다. <br>
> 관리하기 위해 push()와 pop()을 제공한다.