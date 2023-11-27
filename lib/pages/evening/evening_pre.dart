import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/evening/evening_pre4.dart';
import 'package:soul_serenity/theme.dart';

class EveningPre extends StatefulWidget {
  const EveningPre({super.key});

  @override
  State<EveningPre> createState() => _EveningPreState();
}

class _EveningPreState extends State<EveningPre> {
  TextEditingController _summaryController = TextEditingController();
  String percentage = "";
  String descFeeling = "";

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
            SizedBox(width: 10),
            Text(
              "End your evening with reflection 🌙",
              style: boldTextStyle.copyWith(color: greenColor, fontSize: 20),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      label("How well rested did you feel today?"),
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
        height: 20,
      ),
      label("How would you describe how you’re feeling today?"),
      Row(
        children: [
          mainFocusSelect("Satisfied"),
          mainFocusSelect("Exited"),
          mainFocusSelect("Calm"),
          mainFocusSelect("Loved"),
          mainFocusSelect("Tired"),
        ],
      ),
      Row(
        children: [
          mainFocusSelect("Bored"),
          mainFocusSelect("Lonely"),
          mainFocusSelect("Distracted"),
          mainFocusSelect("Sad"),
          mainFocusSelect("Others"),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      label("Write a short summary of your day."),
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
              width: 60,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("evePrep").add({
                      "percentage": percentage,
                      "descFeeling": descFeeling,
                      "summary": _summaryController.text
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EveningPre4()));
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
            style: boldTextStyle.copyWith(color: greenColor),
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
            descFeeling = label;
          });
        },
        child: Chip(
          backgroundColor: descFeeling == label ? Colors.green : green2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
          label: Text(
            label,
            style: boldTextStyle.copyWith(color: greenColor),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.8),
        ),
      ),
    );
  }
  Widget textField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(),
      child: TextFormField(
          controller: _summaryController,
          maxLines: 10,
          style: regulerTextStyle.copyWith(color: greenColor, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Start Writing...',
            hintStyle: lightTextStyle.copyWith(
                color: greenColor), // Text yang muncul ketika TextField kosong
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
        style: boldTextStyle.copyWith(color: greenColor, fontSize: 16)),
  );
}
