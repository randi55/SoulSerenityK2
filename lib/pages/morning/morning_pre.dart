import 'package:flutter/material.dart';
import 'package:soul_serenity/theme.dart';

class MorningPre extends StatefulWidget {
  const MorningPre({super.key});

  @override
  State<MorningPre> createState() => _MorningPreState();
}

class _MorningPreState extends State<MorningPre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: Image.asset("assets/back.png"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: greenColor,
                            backgroundColor: Color.fromRGBO(
                                28, 102, 91, 1000), // ini warnanya masih salah
                            shape: CircleBorder(),
                            minimumSize: Size(10, 60),
                          )),
                    ),
                    Text(
                      "Begin your morning preparation 😊",
                      style: boldTextStyle.copyWith(
                          color: greenColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
