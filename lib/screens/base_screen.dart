import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:freshchat_test/screens/choose_chat/development_screen.dart';
import 'package:freshchat_test/screens/choose_chat/marketing_screen.dart';
import 'package:freshchat_test/screens/choose_chat/sales_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseScreeen extends StatefulWidget {
  final FreshchatUser freshchatUser;
  final int selected;

  const BaseScreeen({Key? key, required this.freshchatUser, required this.selected}) : super(key: key);

  @override
  _BaseScreeenState createState() => _BaseScreeenState();
}

class _BaseScreeenState extends State<BaseScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title: const Text("Choose User"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Freshchat.showConversations(tags: ['sales']);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text("Chat with Sales"),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Freshchat.showConversations(tags: ['marketing']);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text("Chat with Marketing"),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                Freshchat.showConversations(tags: ['development']);
              });
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text("Chat with Development"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
