import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/pages/navbar.dart';
import 'package:soul_serenity/pages/profile/about_page.dart';
import 'package:soul_serenity/pages/profile/change_pass_page.dart';
import 'package:soul_serenity/pages/profile/privacy.dart';
import 'package:soul_serenity/pages/profile/terms.dart';
import 'package:soul_serenity/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isSwitched = false;
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => NavBar()));
                          },
                          child: Image.asset("assets/back.png"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: greenColor,
                            backgroundColor: green2Color, // ini warnanya masih salah
                            shape: CircleBorder(),
                            minimumSize: Size(10, 60),
                          )),
                    ),
                    Text(
                      "Account",
                      style:
                          boldTextStyle.copyWith(color: greenColor, fontSize: 20),
                    ),
                    Image.asset("assets/logo.png", width: 60),
                  ],
                ),
              ),
          
              // BASIC INFORMATION
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: green2Color, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Basic Information",
                      style: boldTextStyle.copyWith(color: greenColor),
                    ),
                  )),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("User")
                      .where("email", isEqualTo: currentUser.currentUser!.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var data = snapshot.data!.docs[i];
                            return ListTile(
                              leading: Icon(
                                Icons.person,
                                color: greenColor,
                              ),
                              title: Text(
                                'Full Name',
                                style: regulerTextStyle.copyWith(
                                    color: greenColor, fontSize: 12),
                              ),
                              subtitle: Text(
                                data['fullName'],
                                style: regulerTextStyle.copyWith(
                                    color: greenColor, fontSize: 14),
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("User")
                      .where("email", isEqualTo: currentUser.currentUser!.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var data = snapshot.data!.docs[i];
                            return ListTile(
                              leading: Icon(
                                Icons.email_rounded,
                                color: greenColor,
                              ),
                              title: Text(
                                'Email',
                                style: regulerTextStyle.copyWith(
                                    color: greenColor, fontSize: 12),
                              ),
                              subtitle: Text(
                                data['email'],
                                style: regulerTextStyle.copyWith(
                                    color: greenColor, fontSize: 14),
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              // BASIC INFORMATION
          
              // LINKS
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: green2Color, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Links",
                          style: boldTextStyle.copyWith(color: greenColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "About the app",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                          },
                          child: Image.asset(
                            "assets/next.png",
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // LINKS
          
              // PRIVACY
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: green2Color, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Privacy",
                          style: boldTextStyle.copyWith(color: greenColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sticky_note_2_rounded,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Terms of use",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TermsPage()));
                          },
                          child: Image.asset(
                            "assets/next.png",
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_rounded,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Privacy Policy",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrivacyPage()));
                          },
                          child: Image.asset(
                            "assets/next.png",
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // PRIVACY
          
              // ACCOUNT SETTINGS
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: green2Color, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Account Settings",
                          style: boldTextStyle.copyWith(color: greenColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.password_rounded,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Password",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()));
                          },
                          child: Image.asset(
                            "assets/next.png",
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign Out",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              print("Signed Out");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            });
                          },
                          child: Image.asset(
                            "assets/next.png",
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ACCOUNT SETTING
            ],
          ),
        ),
      ),
    );
  }
}
