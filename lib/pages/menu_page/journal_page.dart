import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_serenity/pages/evening/evening_journal.dart';
import 'package:soul_serenity/pages/morning/morning_journal.dart';
import 'package:soul_serenity/pages/profile/account_page.dart';
import 'package:soul_serenity/theme.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          //TOP BAR
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/logo.png", width: 40.sp),
              Text(
                "Journal",
                style:
                    boldTextStyle.copyWith(fontSize: 16.sp, color: greenColor),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccountPage()));
                  },
                  child: Image.asset(
                    "assets/akun.png",
                    width: 50.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        //TOP BAR
        SizedBox(
          height: 50.sp,
        ),
        Image.asset(
          "assets/journal.png",
          width: 200.sp,
        ),
        SizedBox(
          height: 90.sp,
        ),
        Text(
          "RECENT ENTRIES",
          style: boldTextStyle.copyWith(
              color: greenColor, fontSize: 12.sp, letterSpacing: 4),
        ),
        SizedBox(height: 5.sp),
        //MORNING BUTTON
        Container(
          width: 250.sp,
          height: 70.sp,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MorningJournal()));
            },
            child: Row(
              children: [
                Image.asset("assets/morning.png", width: 50.sp),
                Column(
                  children: [
                    SizedBox(height: 18.sp),
                    Text(
                      "Morning Journal",
                      style: boldTextStyle.copyWith(fontSize: 11.sp),
                    ),
                    Text(
                      "See your morning journal here",
                      style: lightTextStyle.copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: greenColor, // Warna teks
              side: BorderSide(color: greenColor, width: 2),
              backgroundColor: green2Color, // Warna border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        // MORNING BUTTON
        SizedBox(height: 10.sp),
        //EVENING BUTTON
        Container(
          width: 250.sp,
          height: 70.sp,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EveningJournal()));
            },
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 18.sp),
                    Text(
                      "Evening Journal",
                      style: boldTextStyle.copyWith(fontSize: 11.sp),
                    ),
                    Text("See your evening journal here",
                        style: lightTextStyle.copyWith(fontSize: 10.sp)),
                  ],
                ),
                SizedBox(width: 8.sp),
                Image.asset("assets/evening.png", width: 50.sp),
              ],
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: greenColor, // Warna teks
              side: BorderSide(color: greenColor, width: 2),
              backgroundColor: green2Color, // Warna border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        //EVENING BUTTON
      ])),
    );
  }
}
