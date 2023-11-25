import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/firebase_options.dart';
import 'package:soul_serenity/pages/menu_page/explore_page.dart';
import 'package:soul_serenity/pages/privacy.dart';
import 'package:soul_serenity/pages/signup_page.dart';
import 'package:soul_serenity/pages/terms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
