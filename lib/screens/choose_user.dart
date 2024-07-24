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
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
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
            const Text(
              "Choose a user:",
              style: TextStyle(fontSize: 24.0),
            ),
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
                      child: Text("User ${index + 1}"),
                      style: ElevatedButton.styleFrom(
                        primary:
                            selected == index ? Colors.blueGrey : Colors.grey[300],
                      ),
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        ///SET SELECTED
                        setState(() {
                          // if(selected != index)
                          //   Freshchat.resetUser();
                          selected = index;
                        });


                        if(selected == 0){

                          ///GET NEW FCM TOKEN AND SAVE IT
                          String? token = await FirebaseMessaging.instance.getToken();
                          prefs.setString("fcmToken", token!);
                          print("TOKEN 1 $token");

                          ///GET THE RESTORE ID AND THE EXTERNAL ID
                          String? restoreId = prefs.getString("restoreID1");
                          String? externalId = prefs.getString("externalID1") ?? "user1";

                          ///IF THE RESTORE ID IS NOT NULL THERE IS A CONVERSATION TO
                          ///REOPEN, IF ITS NOT WE SHOULD OPEN NEW CONVERSATION WITH
                          ///NEW USER PROPERTIES
                          if(restoreId != null){
                            freshchatUser = await Freshchat.getUser;
                            print("NOTNULL RESTORE ID: $restoreId");
                            print("NOTNULL EXTERNAL ID: $externalId");
                            freshchatUser.setFirstName("User");
                            freshchatUser.setLastName("1");
                            print("NOTNULL NAME: ${freshchatUser.getFirstName()} ${freshchatUser.getLastName()}");
                            freshchatUser.setPhone("+91", "1111111111");
                            print("NOTNULL PHONE: ${freshchatUser.getPhone()}");
                            freshchatUser.setEmail("user1@gmail.com");
                            print("NOTNULL EMAIL: ${freshchatUser.getEmail()}");
                            Freshchat.setPushRegistrationToken(token);
                            Freshchat.identifyUser(externalId: externalId, restoreId: restoreId);
                            Freshchat.setUser(freshchatUser);
                            print("FUCKY ${freshchatUser.getFirstName()} ${freshchatUser.getLastName()}");
                          }
                          else{
                            ///RESET USER
                            // Freshchat.resetUser();
                            freshchatUser = FreshchatUser(externalId, "");
                            print("NULL RESTORE ID: $restoreId");
                            print("NULL EXTERNAL ID: $externalId");
                            print("USER EXTERNAL ID: ${freshchatUser.getExternalId()}");
                            setState(() {
                              freshchatUser.setFirstName("User");
                              print("FIRST NAME: ${freshchatUser.getFirstName()}");
                              freshchatUser.setLastName("1");
                              print("LAST NAME: ${freshchatUser.getLastName()}");
                              freshchatUser.setPhone("+91", "1111111111");
                              print("PHONE: ${freshchatUser.getPhone()}");
                              freshchatUser.setEmail("user1@gmail.com");
                              print("EMAIL: ${freshchatUser.getEmail()}");
                              Freshchat.identifyUser(externalId: externalId);
                              print("USER EXTERNAL ID 2: ${freshchatUser.getExternalId()}");
                              Map<String, dynamic> userPropertiesJson =
                              {
                                "Accounts": "Paid",
                                "city": "Gold"
                              };
                              Freshchat.setUserProperties(userPropertiesJson);
                              Freshchat.setPushRegistrationToken(token);
                              Freshchat.setUser(freshchatUser);
                            });
                          }
                        }
                        if(selected == 1){
                          ///GET NEW FCM TOKEN AND SAVE IT
                          String? token = await FirebaseMessaging.instance.getToken();
                          prefs.setString("fcmToken", token!);
                          print("TOKEN 2 $token");

                          ///GET THE RESTORE ID AND THE EXTERNAL ID
                          String? restoreId = prefs.getString("restoreID2");
                          String? externalId = prefs.getString("externalID2") ?? "user2";

                          ///IF THE RESTORE ID IS NOT NULL THERE IS A CONVERSATION TO
                          ///REOPEN, IF ITS NOT WE SHOULD OPEN NEW CONVERSATION WITH
                          ///NEW USER PROPERTIES
                          if(restoreId != null){
                            print("NOTNULL RESTORE ID: $restoreId");
                            print("NOTNULL EXTERNAL ID: $externalId");
                            freshchatUser = await Freshchat.getUser;
                            freshchatUser.setFirstName("User");
                            freshchatUser.setLastName("2");
                            freshchatUser.setPhone("+91", "2222222222");
                            freshchatUser.setEmail("user2@gmail.com");
                            Freshchat.setPushRegistrationToken(token);
                            Freshchat.identifyUser(externalId: externalId, restoreId: restoreId);
                            Freshchat.setUser(freshchatUser);
                            print("FUCKY ${freshchatUser.getFirstName()} ${freshchatUser.getLastName()}");
                          }
                          else{
                            ///RESET USER
                            // Freshchat.resetUser();
                            freshchatUser = FreshchatUser(externalId, "");
                            print("NULL RESTORE ID: $restoreId");
                            print("NULL EXTERNAL ID: $externalId");
                            print("USER EXTERNAL ID: ${freshchatUser.getExternalId()}");
                            setState(() {
                              freshchatUser.setFirstName("User");
                              print("FIRST NAME: ${freshchatUser.getFirstName()}");
                              freshchatUser.setLastName("2");
                              print("LAST NAME: ${freshchatUser.getLastName()}");
                              freshchatUser.setPhone("+91", "2222222222");
                              print("PHONE: ${freshchatUser.getPhone()}");
                              freshchatUser.setEmail("user2@gmail.com");
                              print("EMAIL: ${freshchatUser.getEmail()}");
                              Freshchat.identifyUser(externalId: externalId);
                              print("USER EXTERNAL ID 2: ${freshchatUser.getExternalId()}");
                              Map<String, dynamic> userPropertiesJson =
                              {
                                "Accounts": "Paid",
                                "city": "Gold"
                              };
                              Freshchat.setUserProperties(userPropertiesJson);
                              Freshchat.setPushRegistrationToken(token);
                              Freshchat.setUser(freshchatUser);
                            });
                          }
                        }
                        if(selected == 2){
                          ///GET NEW FCM TOKEN AND SAVE IT
                          String? token = await FirebaseMessaging.instance.getToken();
                          prefs.setString("fcmToken", token!);
                          print("TOKEN 3 $token");

                          ///GET THE RESTORE ID AND THE EXTERNAL ID
                          String? restoreId = prefs.getString("restoreID3");
                          String? externalId = prefs.getString("externalID3") ?? "user3";

                          ///IF THE RESTORE ID IS NOT NULL THERE IS A CONVERSATION TO
                          ///REOPEN, IF ITS NOT WE SHOULD OPEN NEW CONVERSATION WITH
                          ///NEW USER PROPERTIES
                          if(restoreId != null){
                            print("NOTNULL RESTORE ID: $restoreId");
                            print("NOTNULL EXTERNAL ID: $externalId");
                            freshchatUser = await Freshchat.getUser;
                            freshchatUser.setFirstName("User");
                            freshchatUser.setLastName("3");
                            freshchatUser.setPhone("+91", "3333333333");
                            freshchatUser.setEmail("user3@gmail.com");
                            Freshchat.setPushRegistrationToken(token);
                            Freshchat.identifyUser(externalId: externalId, restoreId: restoreId);
                            Freshchat.setUser(freshchatUser);
                            print("FUCKY ${freshchatUser.getFirstName()} ${freshchatUser.getLastName()}");
                          }
                          else{
                            ///RESET USER
                            // Freshchat.resetUser();
                            freshchatUser = FreshchatUser(externalId, "");
                            print("NULL RESTORE ID: $restoreId");
                            print("NULL EXTERNAL ID: $externalId");
                            print("USER EXTERNAL ID: ${freshchatUser.getExternalId()}");
                            setState(() {
                              freshchatUser.setFirstName("User");
                              print("FIRST NAME: ${freshchatUser.getFirstName()}");
                              freshchatUser.setLastName("3");
                              print("LAST NAME: ${freshchatUser.getLastName()}");
                              freshchatUser.setPhone("+91", "3333333333");
                              print("PHONE: ${freshchatUser.getPhone()}");
                              freshchatUser.setEmail("user3@gmail.com");
                              print("EMAIL: ${freshchatUser.getEmail()}");
                              Freshchat.identifyUser(externalId: externalId);
                              print("USER EXTERNAL ID 2: ${freshchatUser.getExternalId()}");
                              Map<String, dynamic> userPropertiesJson =
                              {
                                "Accounts": "Paid",
                                "city": "Gold"
                              };
                              Freshchat.setUserProperties(userPropertiesJson);
                              Freshchat.setPushRegistrationToken(token);
                              Freshchat.setUser(freshchatUser);
                            });
                          }
                        }


                        var restoreStream = Freshchat.onRestoreIdGenerated;
                        var restoreStreamSubscription =
                        restoreStream.listen((event) async {
                          FreshchatUser freshchatUser = await Freshchat.getUser;
                          print("INO NAME: ${freshchatUser.getFirstName()} ${freshchatUser.getLastName()}");
                          var restoreId = freshchatUser.getRestoreId();
                          print("INO RESTORE ID: $restoreId");
                          var externalId = freshchatUser.getExternalId();
                          print("INO EXTERNAL ID: $externalId");

                          if(selected == 0){
                            prefs.setString("restoreID1", restoreId!);
                            prefs.setString("externalID1", externalId!);
                          }
                          if(selected == 1){
                            prefs.setString("restoreID2", restoreId!);
                            prefs.setString("externalID2", externalId!);
                          }
                          if(selected == 2){
                            prefs.setString("restoreID3", restoreId!);
                            prefs.setString("externalID3", externalId!);
                          }

                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BaseScreeen(
                            freshchatUser: freshchatUser,
                            selected: selected,
                          )));
                },
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                color: Colors.blueGrey,
                child: const Text("Proceed", style: TextStyle(color: Colors.white, fontSize: 24.0),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
