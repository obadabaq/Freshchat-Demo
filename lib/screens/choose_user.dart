import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseUser extends StatefulWidget {
  @override
  _ChooseUserState createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {
  int selected = 1;

  late FreshchatUser freshchatUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose User"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text("Choose a user:", style: TextStyle(fontSize: 24.0),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    decoration: BoxDecoration(
                        borderRadius: index == 1
                            ? BorderRadius.circular(0)
                            : BorderRadius.circular(100)),
                    child: ElevatedButton(
                      child: Text("User ${index+1}"),
                      style: ElevatedButton.styleFrom(
                        primary: selected == index ? Colors.blue : Colors.grey[300],
                      ),
                      onPressed: () async {
                        Freshchat.resetUser();
                        String? token = await FirebaseMessaging.instance.getToken();
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("fcmToken", token!);
                        freshchatUser = FreshchatUser("", "user${selected+1}");
                        setState(() {
                          selected = index;
                          freshchatUser.setFirstName("User");
                          freshchatUser.setLastName("${selected+1}");
                          freshchatUser.setPhone("+91", "${selected+1}${selected+1}${selected+1}");
                          Freshchat.setPushRegistrationToken(token);
                          Freshchat.setUser(freshchatUser);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text("then press (->) ", style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BaseScreeen(freshchatUser: freshchatUser,)));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
