import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_serenity/pages/morning/morning_pre4.dart';
import 'package:soul_serenity/pages/navbar.dart';
import 'package:soul_serenity/theme.dart';

class MorningPre extends StatefulWidget {
  const MorningPre({super.key});

  @override
  State<MorningPre> createState() => _MorningPreState();
}

class _MorningPreState extends State<MorningPre> {
  TextEditingController _planController = TextEditingController();
  String percentage = "";
  String mainFocus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            // padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                "Begin your morning preparation ☀️",
                textAlign: TextAlign.center,
                style:
                    boldTextStyle.copyWith(color: greenColor, fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40.sp,
      ),
      label("How well did you sleep today?"),
      Row(
        children: [
          percentageSelect("0%"),
          percentageSelect("25%"),
          percentageSelect("50%"),
          percentageSelect("75%"),
          percentageSelect("100%"),
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
      label("What’s your main focus for today?"),
      Row(
        children: [
          mainFocusSelect("Work"),
          mainFocusSelect("Relaxing"),
          mainFocusSelect("Learning"),
          mainFocusSelect("Friends"),
          mainFocusSelect("Party"),
        ],
      ),
      Row(
        children: [
          mainFocusSelect("Selfcare"),
          mainFocusSelect("Partner"),
          mainFocusSelect("Family"),
          mainFocusSelect("Cleaning"),
          mainFocusSelect("Others"),
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
      label("What do you plan to do today?"),
      textField(context),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 60.sp,
              height: 60.sp,
              child: OutlinedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("mornPrep").add({
                      "percentage": percentage,
                      "mainFocus": mainFocus,
                      "plan": _planController.text
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MorningPre4()));
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
    ])));
  }

  Widget percentageSelect(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            percentage = label;
          });
        },
        child: Chip(
          backgroundColor: percentage == label ? Colors.green : green2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
          label: Text(
            label,
            style: boldTextStyle.copyWith(color: greenColor, fontSize: 12.sp),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.8),
        ),
      ),
    );
  }

  Widget mainFocusSelect(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            mainFocus = label;
          });
        },
        child: Chip(
          backgroundColor: mainFocus == label ? Colors.green : green2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
          label: Text(
            label,
            style: boldTextStyle.copyWith(color: greenColor, fontSize: 9.sp),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 4.3, vertical: 1.8),
        ),
      ),
    );
  }

  Widget textField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        height: 200.sp,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(),
        child: TextFormField(
            controller: _planController,
            maxLines: 10,
            style:
                regulerTextStyle.copyWith(color: greenColor, fontSize: 14.sp),
            decoration: InputDecoration(
              hintText: 'Start Writing...',
              hintStyle: lightTextStyle.copyWith(
                  color:
                      greenColor), // Text yang muncul ketika TextField kosong
              border: OutlineInputBorder(
                borderSide: BorderSide(color: greenColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greenColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              filled: true,
              fillColor: green2Color,
            )),
      ),
    );
  }
}

Widget label(String label) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Text(label,
        style: boldTextStyle.copyWith(color: greenColor, fontSize: 16.sp)),
  );
}
