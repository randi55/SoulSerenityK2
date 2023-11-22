import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/home_page.dart';
import 'package:soul_serenity/widget/navbar.dart';
import 'package:soul_serenity/widget/topbar.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
      
    );
  }
}