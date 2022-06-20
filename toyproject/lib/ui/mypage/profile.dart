import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 40, //사이즈 조절
          backgroundImage: AssetImage('assets/profile.jpg'),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              '안녕하세요',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  'AdminNickName',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 20),
                ),
                SizedBox(width: 5),
                Text('님'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
