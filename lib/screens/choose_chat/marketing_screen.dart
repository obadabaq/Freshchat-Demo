import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';

class MarketingScreen extends StatefulWidget {
  final FreshchatUser freshchatUser;
  final int selected;

  const MarketingScreen({Key? key, required this.freshchatUser, required this.selected})
      : super(key: key);

  @override
  _MarketingScreenState createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketing"),
      ),
      body: const Center(
        child: Text("Marketing"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Freshchat.showConversations(tags: ['marketing']);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}