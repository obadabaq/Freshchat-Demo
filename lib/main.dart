import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_test/screens/choose_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if(await Freshchat.isFreshchatNotification(message.data))
  {
    Freshchat.handlePushNotification(message.data);
  }
  print('Handling a background message ${message.messageId}');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? token = await FirebaseMessaging.instance.getToken();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("fcmToken", token!);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

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
    clearPrefs();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if(await Freshchat.isFreshchatNotification(message.data))
      {
      Freshchat.handlePushNotification(message.data);
      }
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });


    Freshchat.init("551f481f-aae8-4b4a-afec-e6eb52e43292",
        "ead75102-10d0-4500-84f7-4ae86136d0c9", "msdk.freshchat.com");
    super.initState();
  }

  clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChooseUser(),
    );
  }
}


