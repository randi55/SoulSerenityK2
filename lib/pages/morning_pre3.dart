import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/morning_pre4.dart';
import 'package:soul_serenity/theme.dart';

class MorningPre3 extends StatefulWidget {
  final int initialValue;

  const MorningPre3({super.key, this.initialValue = 0});

  @override
  State<MorningPre3> createState() => _MorningPre3State();
}

class _MorningPre3State extends State<MorningPre3> {
  int currentValue = 0;
  late TextEditingController controller;
  String text = '';

  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 500),
                    width: index == currentValue ? 50 : 20,
                    height: 8,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("What do you plan to do today?",
                style: boldTextStyle.copyWith(fontSize: 20, color: greenColor)),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                maxLines: 15,
                controller: controller,
                onSubmitted: (String value) {
                  setState(() {
                    text = controller.text;
                  });
                },
                style: TextStyle(
                  color: greenColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,

                ),
                decoration: InputDecoration(
                  hintText: 'Start Writing...',
                  hintStyle: lightTextStyle.copyWith(color: greenColor), // Text yang muncul ketika TextField kosong
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                    borderRadius:
                        BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                    borderRadius:
                        BorderRadius.circular(25.0),
                  ),
                  filled: true,
                  fillColor: green2Color,
                ),
              ),
            ),

            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(right: 50.0, left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MorningPre2()));
                          moveToNext();
                        },
                        child: Image.asset("assets/plus.png"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: greenColor, // Warna teks
                          side: BorderSide(color: greenColor, width: 1),
                          backgroundColor: green2Color, // Warna border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        )),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MorningPre4()));
                          // moveToNext();
                        },
                        child: Image.asset("assets/ceklist.png"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: greenColor, // Warna teks
                          side: BorderSide(color: greenColor, width: 1),
                          backgroundColor: green2Color, // Warna border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToNext() {
    setState(() {
      currentValue = (currentValue + 1) % 3;
    });
  }
}
