import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MarketingScreen extends StatefulWidget {
  final FreshchatUser freshchatUser;

  const MarketingScreen({Key? key, required this.freshchatUser})
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