import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/evening_pre1.dart';
import 'package:soul_serenity/pages/evening_pre2.dart';
import 'package:soul_serenity/pages/evening_pre4.dart';
import 'package:soul_serenity/pages/home_page.dart';
import 'package:soul_serenity/pages/morning_pre1.dart';
import 'package:soul_serenity/pages/morning_pre2.dart';
import 'package:soul_serenity/pages/morning_pre3.dart';
import 'package:soul_serenity/pages/morning_pre4.dart';
import 'package:soul_serenity/theme.dart';
import 'package:soul_serenity/widget/morning_button.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> body = [
    MorningPre3(),
    HomePage(),
    EveningPre4(),
    MorningButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          // color: green2Color, // Warna latar belakang
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: green2Color,
            selectedItemColor: greenColor,
            unselectedItemColor: greenColor,
            selectedLabelStyle: boldTextStyle,
            unselectedLabelStyle: lightTextStyle,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                activeIcon: Image.asset("assets/home.png"),
                icon: Image.asset("assets/unhome.png"),
              ),
              BottomNavigationBarItem(
                label: "Explore",
                activeIcon: Image.asset("assets/rocket.png"),
                icon: Image.asset('assets/unrocket.png'),
              ),
              BottomNavigationBarItem(
                label: "Community",
                activeIcon: Image.asset("assets/users.png"),
                icon: Image.asset('assets/unusers.png'),
              ),
              BottomNavigationBarItem(
                label: "Journal",
                activeIcon: Image.asset("assets/document.png"),
                icon: Image.asset('assets/undocument.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
