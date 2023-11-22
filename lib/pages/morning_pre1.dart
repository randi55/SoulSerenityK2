import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/morning_pre2.dart';
import 'package:soul_serenity/pages/morning_pre4.dart';
import 'package:soul_serenity/theme.dart';

class MorningPre1 extends StatefulWidget {
  final int initialValue;

  const MorningPre1({Key? key, this.initialValue = 0}) : super(key: key);

  @override
  _MorningPre1State createState() => _MorningPre1State();
}

class _MorningPre1State extends State<MorningPre1> {
  int currentValue = 0;
  String currentImage = "assets/emote1.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(height: 200),
        Text("How well did you sleep today?",
            style: boldTextStyle.copyWith(fontSize: 20, color: greenColor)),
        SizedBox(height: 40),
        Center(
          child: Container(
            width: 400,
            decoration: BoxDecoration(
                color: green2Color, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        // setState(() {
                        //   currentImage = "assets/onemote1.png";
                        // });
                      },
                      child: Text("0%",style: boldTextStyle.copyWith(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: greenColor, // Warna teks
                        side: BorderSide(color: greenColor, width: 3),
                        backgroundColor: green2Color, // Warna border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        // setState(() {
                        //   currentImage = "assets/onemote1.png";
                        // });
                      },
                      child: Text("25%",style: boldTextStyle.copyWith(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: greenColor, // Warna teks
                        side: BorderSide(color: greenColor, width: 3),
                        backgroundColor: green2Color, // Warna border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        // setState(() {
                        //   currentImage = "assets/onemote1.png";
                        // });
                      },
                      child: Text("50%",style: boldTextStyle.copyWith(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: greenColor, // Warna teks
                        side: BorderSide(color: greenColor, width: 3),
                        backgroundColor: green2Color, // Warna border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        // setState(() {
                        //   currentImage = "assets/onemote1.png";
                        // });
                      },
                      child: Text("75%",style: boldTextStyle.copyWith(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: greenColor, // Warna teks
                        side: BorderSide(color: greenColor, width: 3),
                        backgroundColor: green2Color, // Warna border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        // setState(() {
                        //   currentImage = "assets/onemote1.png";
                        // });
                      },
                      child: Text("100%",style: boldTextStyle.copyWith(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: greenColor, // Warna teks
                        side: BorderSide(color: greenColor, width: 3),
                        backgroundColor: green2Color, // Warna border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50,
                height: 50,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(100),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey, // Warna shadow
                //       blurRadius: 10, // Jumlah blur
                //       offset: Offset(-2, -2),
                //       blurStyle: BlurStyle.inner // Offset shadow
                //     ),
                //   ],
                // ),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorningPre2()));
                    },
                    child: Image.asset("assets/next.png"),
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
    );
  }

  void moveToNext() {
    setState(() {
      currentValue = (currentValue + 1) % 3;
    });
  }
}
