import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:freshchat_test/screens/choose_chat/development_screen.dart';
import 'package:freshchat_test/screens/choose_chat/marketing_screen.dart';
import 'package:freshchat_test/screens/choose_chat/sales_screen.dart';

class BaseScreeen extends StatefulWidget {
  final FreshchatUser freshchatUser;

  const BaseScreeen({Key? key, required this.freshchatUser}) : super(key: key);

  @override
  _BaseScreeenState createState() => _BaseScreeenState();
}

class _BaseScreeenState extends State<BaseScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          SalesScreen(freshchatUser: widget.freshchatUser),
          MarketingScreen(freshchatUser: widget.freshchatUser),
          DevelopmentScreen(freshchatUser: widget.freshchatUser),
        ],
      ),
    );
  }
}
