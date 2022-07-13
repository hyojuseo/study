import 'package:apple_coding3/threeweeks/add_dialog.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

//dart는 타입을 잘 지켜야 된다.
class PermissionEx extends StatefulWidget {
  const PermissionEx({Key? key}) : super(key: key);

  @override
  State<PermissionEx> createState() => _PermissionExState();
}

class _PermissionExState extends State<PermissionEx> {
  var name = [];

  @override
  void initState() {
    super.initState();
  }

  //2번이상 권한 거절하면 더이상 팝업창이 뜨지않는다.
  //android 11이상 IOS에서 해당.
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      //연락처 꺼내기
      var contacts = await ContactsService.getContacts();
      name = contacts;
      setState((){});
      // print(contacts[0].givenName);
      //연락처 추가하기
      // var newPerson = Contact();
      // newPerson.givenName ='hodu';
      // ContactsService.addContact(newPerson);

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings(); //더이상 팝업창이 뜨지않을 수 있기에 직접 권한설정하라고 한다.
    }
  }

  void addContact(var addPerson) {
    var newPerson = Contact();
    newPerson.displayName = addPerson;
    ContactsService.addContact(newPerson);
    setState(() {
      name.add(newPerson);
    });
  }

  Widget _body() {
    print('err1');
    print(name.length);
    if (name.isNotEmpty) {
      return ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            print('err2');
            return ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 50,
              ),
              title:
                  Text(name[index].displayName.toString()), //displayName : 전체이름
            );
          });
    } else {
      return Center(
        child: Text('not data'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                  getPermission();
              },
              icon: Icon(Icons.call),
              color: Colors.grey),
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddDialog(
                  addContact: addContact,
                );
              });
        },
        child: Text('+'),
      ),
    );
  }
}
