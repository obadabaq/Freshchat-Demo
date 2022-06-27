import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:freshchat_test/development_screen.dart';
import 'package:freshchat_test/sales_screen.dart';
import 'package:freshchat_test/marketing_screen';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshChat Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FreshChat Test Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Freshchat.init("864f2fa2-1fd2-496b-b327-f40a8dbfe1bc",
        "6d67abc2-b479-477a-9422-0f8189027eed", "msdk.eu.freshchat.com");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          SalesScreen(),
          MarketingScreen(),
          DevelopmentScreen(),
        ],
      ),
    );
  }
}


