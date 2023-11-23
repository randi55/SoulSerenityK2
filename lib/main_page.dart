import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/home_page.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/TEST/test_page.dart';
import 'package:soul_serenity/widget/navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return NavBar();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}