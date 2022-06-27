import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';


class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Development"),
      ),
      body: const Center(
        child: Text("Chat with Development"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Freshchat.resetUser();
            FreshchatUser freshchatUser = FreshchatUser("", "");
            freshchatUser.setFirstName("John");
            freshchatUser.setLastName("toDevelopment");
            freshchatUser.setEmail("johndoe@dead.man");
            freshchatUser.setPhone("+91","1234234123");
            Freshchat.setUser(freshchatUser);
            Freshchat.showConversations(tags: ['development']);
          });
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}