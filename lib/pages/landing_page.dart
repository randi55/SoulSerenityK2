import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //TOP BAR
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", width: 45),
                Text(
                  "Soul Serenity",
                  style: boldTextStyle.copyWith(
                      color: greenColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            "assets/landing.png",
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Text(
                  "take a deep breath, then exhale slowly",
                  style: boldTextStyle.copyWith(
                      color: greenColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 24,bottom:24 ),
                  child: Text(
                    "Enhance your day with greater mindfulness, tranquility, and improved your sleep through Soul Serenity.Leave  a note about your emotions to clear your head and feel better. ",
                    style: regulerTextStyle.copyWith(
                        color: greenColor, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80),
          //START BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 160,
                        decoration: BoxDecoration(
                            color: green2Color,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Start",
                            style: boldTextStyle.copyWith(color: greenColor,fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
