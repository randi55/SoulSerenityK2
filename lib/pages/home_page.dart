import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/morning_pre1.dart';
import 'package:soul_serenity/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentImage = "assets/emote1.png";
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TOP BAR
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/logo.png",width: 50),
              Text(
                "How are you today?",
                style: boldTextStyle.copyWith(fontSize: 16, color: greenColor),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Image.asset("assets/akun.png"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  // fixedSize: Size(50, 50)
                ),
              ),
            ],
          ),
        ),
        //TOP BAR

        //MOOD BUTTON
        Center(
          child: Container(
            width: 350,
            decoration: BoxDecoration(
                color: green2Color, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentImage = "assets/onemote1.png";
                      });
                    },
                    child: Image.asset(currentImage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/emote2.png"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/emote3.png"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/emote4.png"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/emote5.png"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // MOOD BUTTON

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
          child: Text("DAILY REFLECTIONS",style: boldTextStyle.copyWith(color: greenColor,letterSpacing: 10.0)),
        ),
        SizedBox(height: 10),
        //MORNING BUTTON
        Container(
          width: MediaQuery.of(context).size.width - 220,
          height: 90,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorningPre1()));
            },
            child: Row(
              children: [
                Image.asset("assets/morning.png",width: 80),
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
                Image.asset("assets/evening.png",width: 70),
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
    ));
  }
}
