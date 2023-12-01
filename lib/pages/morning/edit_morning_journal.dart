import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soul_serenity/pages/morning/morning_journal.dart';
import 'package:soul_serenity/theme.dart';

class EditMorningJournal extends StatefulWidget {
  const EditMorningJournal(
      {super.key, required this.document, required this.id});
  final Map<String, dynamic> document;
  final String id;

  @override
  State<EditMorningJournal> createState() => _EditMorningJournalState();
}

class _EditMorningJournalState extends State<EditMorningJournal> {
  TextEditingController _planController = TextEditingController();
  String percentage = "";
  String mainFocus = "";

  @override
  void initState() {
    _planController = TextEditingController(text: widget.document["plan"]);
    percentage = widget.document["percentage"];
    mainFocus = widget.document["mainFocus"];
    super.initState();
  }

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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MorningJournal()));
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
            Text(
              "Edit and Delete Morning Journal",
              style: boldTextStyle.copyWith(color: greenColor, fontSize: 20),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40,
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
        height: 20,
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
        height: 20,
      ),
      label("What do you plan to do today?"),
      textField(context),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 130,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("mornPrep")
                        .doc(widget.id)
                        .delete()
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorningJournal()));
                    });
                    Fluttertoast.showToast(
                        msg:
                            "You have successfully deleted your Morning Journal",
                        gravity: ToastGravity.TOP,
                        webBgColor: "linear-gradient(to bottom, #1C665B, #4B997E)",
                        timeInSecForIosWeb: 2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/delete.png",width: 30,),
                      // Icon(Icons.restore_from_trash_sharp),
                      SizedBox(width: 5.0,),
                      Text(
                        "Delete",
                        style: boldTextStyle.copyWith(color: greenColor),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green2Color, // Warna border
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),
            ),
            Container(
              width: 130,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("mornPrep")
                        .doc(widget.id)
                        .update({
                      "percentage": percentage,
                      "mainFocus": mainFocus,
                      "plan": _planController.text
                    });
                    Fluttertoast.showToast(
                        msg:
                            "You have successfully edited your Morning Journal",
                        gravity: ToastGravity.TOP,
                        webBgColor: "linear-gradient(to bottom, #1C665B, #4B997E)",
                        timeInSecForIosWeb: 2);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MorningJournal()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/edit.png",width: 30,),
                      SizedBox(width: 5,),
                      Text(
                        "Edit",
                        style: boldTextStyle.copyWith(color: green2Color),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor, 
                    elevation: 3,
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
            controller: _planController,
            maxLines: 10,
            style: regulerTextStyle.copyWith(color: greenColor, fontSize: 14),
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
        style: boldTextStyle.copyWith(color: greenColor, fontSize: 16)),
  );
}
