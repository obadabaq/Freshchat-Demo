import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';


class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales"),
      ),
      body: const Center(
        child: Text("Chat with Sales"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Freshchat.resetUser();
            FreshchatUser freshchatUser = FreshchatUser("", "");
            freshchatUser.setFirstName("John");
            freshchatUser.setLastName("toSales");
            freshchatUser.setEmail("johndoe@dead.man");
            freshchatUser.setPhone("+91","1234234123");
            Freshchat.setUser(freshchatUser);
            Freshchat.showConversations(tags: ['sales']);
          });
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}