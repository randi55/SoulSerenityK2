import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
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

  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    '☹️',
    '🙁',
    '😐',
    '🙂',
    '😊',
  ];

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
                Image.asset("assets/logo.png", width: 50),
                Text(
                  "How are you today?",
                  style:
                      boldTextStyle.copyWith(fontSize: 16, color: greenColor),
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
                      child: Image.asset("assets/akun.png")),
                ),
              ],
            ),
          ),
          //TOP BAR

          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                ChipsChoice.single(
                  value: tag,
                  onChanged: (val) => setState(() => tag = val),
                  choiceItems: C2Choice.listFrom(
                      source: options, value: (i, v) => i, label: (i, v) => v),
                  wrapped: true,
                  choiceStyle: C2ChipStyle.toned(
                    height: 25,
                    borderStyle: BorderStyle.solid,
                    borderRadius: BorderRadius.circular(50),
                    backgroundColor: green2Color,
                    backgroundOpacity: 1,
                    borderWidth: 1,
                    borderColor: greenColor,
                    foregroundStyle: lightTextStyle,
                    foregroundColor: greenColor,
                    selectedStyle: C2ChipStyle(
                        foregroundStyle: boldTextStyle,
                        borderColor: greenColor,
                        borderWidth: 2),
                  ),
                )
              ],
            ),
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
                      defaultTextStyle: lightTextStyle,
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
          // CALENDAR
          Container(
            child: Text("DAILY REFLECTIONS",
                style: boldTextStyle.copyWith(
                    color: greenColor, letterSpacing: 10.0)),
          ),
          SizedBox(height: 10),
          //MORNING BUTTON
          Container(
            width: MediaQuery.of(context).size.width - 220,
            height: 90,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MorningPre()));
              },
              child: Row(
                children: [
                  Image.asset("assets/morning.png", width: 80),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Morning Preparation",
                        style: boldTextStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Let's start your day",
                        style: lightTextStyle,
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
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width - 220,
            height: 90,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EveningPre()));
              },
              child: Row(
                children: [
                  SizedBox(width: 35),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Evening Reflection",
                        style: boldTextStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Sum up your day",
                        style: lightTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Image.asset("assets/evening.png", width: 60),
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
        ],
      ),
    ));
  }
}
