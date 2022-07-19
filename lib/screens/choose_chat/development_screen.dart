import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';

class DevelopmentScreen extends StatefulWidget {
  final FreshchatUser freshchatUser;
  final int selected;


  const DevelopmentScreen({Key? key, required this.freshchatUser, required this.selected}) : super(key: key);

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Development"),
      ),
      body: const Center(
        child: Text("Development"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Freshchat.showConversations(tags: ['development']);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
