import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soul_serenity/pages/evening/evening_pre.dart';
import 'package:soul_serenity/pages/morning/morning_pre.dart';
import 'package:soul_serenity/pages/profile/account_page.dart';
import 'package:soul_serenity/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //TOP BAR
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png", width: 38.sp),
                  Text(
                    "How are you today?",
                    style: boldTextStyle.copyWith(
                        fontSize: 16.sp, color: greenColor),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                        child: Image.asset(
                          "assets/akun.png",
                          width: 50.sp,
                        )),
                  ),
                ],
              ),
            ),
            //TOP BAR
            SizedBox(
              height: 30.sp,
            ),
            // MOOD BUTTON
            Container(
              width: 280.sp,
              decoration: BoxDecoration(
                  color: green2Color, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg:
                                    "I know it's tough right now, but remember that clouds eventually clear, and the sun will shine again. Reach out to someone you trust and let them be your support.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to bottom, #1C665B, #4B997E)",
                                webPosition: "center",
                                fontSize: 16.0,
                              );
                            },
                            child:
                                Image.asset("assets/emote1.png", width: 30))),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg:
                                    "Disappointments are a part of life, but they don't define you. Use this moment to reflect, learn, and grow stronger. Tomorrow is a new opportunity.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to bottom, #1C665B, #4B997E)",
                                webPosition: "center",
                                fontSize: 16.0,
                              );
                            },
                            child:
                                Image.asset("assets/emote2.png", width: 30))),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg:
                                    "In moments of neutrality, find peace in the stillness. Take a deep breath and appreciate the simple joys around you. Life is a journey, and every step is valuable.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to bottom, #1C665B, #4B997E)",
                                webPosition: "center",
                                fontSize: 16.0,
                              );
                            },
                            child:
                                Image.asset("assets/emote3.png", width: 30))),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (e) {
                          Container();
                        },
                        child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg:
                                    "Embrace the contentment you feel now. Celebrate your achievements, big or small. You've earned this moment of peace. Continue to savor the present.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to bottom, #1C665B, #4B997E)",
                                webPosition: "center",
                                fontSize: 16.0,
                              );
                            },
                            child:
                                Image.asset("assets/emote4.png", width: 30))),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg:
                                    "Your happiness is a testament to your resilience. Cherish these moments, surround yourself with positivity, and let the joy radiate within and beyond. You deserve it.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to bottom, #1C665B, #4B997E)",
                                webPosition: "center",
                                fontSize: 16.0,
                              );
                            },
                            child:
                                Image.asset("assets/emote5.png", width: 30))),
                  ],
                ),
              ),
            ),
            // MOOD BUTTON
            SizedBox(
              height: 10.sp,
            ),
            // CALENDAR
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: green2Color,
                        borderRadius: BorderRadius.circular(20)),
                    child: TableCalendar(
                      locale: "en_US",
                      rowHeight: 35,
                      daysOfWeekHeight: 40,
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle:
                              boldTextStyle.copyWith(color: Colors.white),
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)))),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: boldTextStyle,
                        weekendStyle: boldTextStyle,
                      ),
                      availableGestures: AvailableGestures.all,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime(2010, 10, 16),
                      lastDay: DateTime(2030, 3, 14),
                      onDaySelected: _onDaySelected,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      calendarStyle: CalendarStyle(
                        defaultTextStyle:
                            lightTextStyle.copyWith(fontSize: 12.sp),
                        outsideDaysVisible: false,
                        todayDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.sp),
            // CALENDAR
            Container(
              child: Text("DAILY REFLECTIONS",
                  style: boldTextStyle.copyWith(
                      color: greenColor, letterSpacing: 4.0, fontSize: 12.sp)),
            ),
            SizedBox(height: 5.sp),
            //MORNING BUTTON
            Container(
              width: 250.sp,
              height: 70.sp,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MorningPre()));
                },
                child: Row(
                  children: [
                    Image.asset("assets/morning.png", width: 80.sp),
                    SizedBox(width: 8.sp),
                    Column(
                      children: [
                        SizedBox(height: 18.sp),
                        Text(
                          "Morning Preparation",
                          style: boldTextStyle.copyWith(fontSize: 12.sp),
                        ),
                        Text(
                          "Let's start your day",
                          style: lightTextStyle.copyWith(fontSize: 12.sp),
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

            //EVENING BUTTON
            SizedBox(height: 10.sp),
            Container(
              width: 250.sp,
              height: 70.sp,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EveningPre()));
                },
                child: Row(
                  children: [
                    SizedBox(width: 25.sp),
                    Column(
                      children: [
                        SizedBox(height: 18.sp),
                        Text(
                          "Evening Reflection",
                          style: boldTextStyle.copyWith(fontSize: 12.sp),
                        ),
                        Text(
                          "Sum up your day",
                          style: lightTextStyle.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    Image.asset("assets/evening.png", width: 80.sp),
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
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
