import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyproject/controller/bottom_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? idController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    passwordController = TextEditingController();
  }

  Widget _image() {
    return Image.asset(
      'assets/logo.png',
      scale: 1.3,
    );
  }

  Widget _login() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 80, right: 80, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //아이디 입력폼
          TextFormField(
            decoration: InputDecoration(
                hintText: '아이디를 입력하세요',
                hintStyle: const TextStyle(color: Colors.grey),
                labelText: '아이디',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                )),
          ),
          const SizedBox(height: 15),
          //비밀번호 입력폼
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '비밀번호를 입력하세요',
              hintStyle: const TextStyle(color: Colors.grey),
              labelText: '비밀번호',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  '회원가입',
                  style: TextStyle(color: Colors.brown),
                )),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed('/home');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('로그인 성공!'),
                    duration: const Duration(milliseconds: 1000),
                    backgroundColor: Colors.grey.withOpacity(0.8),
                    behavior: SnackBarBehavior.floating,
                    width: 115,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.brown, onPrimary: Colors.white12),
              child: const Text(
                '로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //true이면 쌓인것이 없을때 종료하고
      //false이면 마지막 쌓인페이지에서 앱종료가 되지않는다.
      onWillPop: BottomController.to.willPopAction,

      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              fit: BoxFit.cover,
              image: AssetImage('assets/background.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(),
              _login(),
            ],
          ),
        ),
      ),
    );
  }
}
