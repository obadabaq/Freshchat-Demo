import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesScreen extends StatefulWidget {
  final FreshchatUser freshchatUser;

  const SalesScreen({Key? key, required this.freshchatUser}) : super(key: key);

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
        child: Text("Sales"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            Freshchat.showConversations(tags: ['sales']);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}