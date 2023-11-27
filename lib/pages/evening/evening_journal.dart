import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/navbar.dart';
import 'package:soul_serenity/theme.dart';

class EveningJournal extends StatefulWidget {
  const EveningJournal({super.key});

  @override
  State<EveningJournal> createState() => _EveningJournalState();
}

class _EveningJournalState extends State<EveningJournal> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("evePrep").snapshots();

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
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavBar()));
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
                "Evening Journal 🌙",
                style: boldTextStyle.copyWith(fontSize: 16, color: greenColor),
              ),
              Image.asset("assets/logo.png", width: 50),
            ],
          ),
        ),
        //TOP BAR
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // warna bayangan
                  offset: Offset(
                      0, 3), // geser bayangan secara horizontal dan vertikal
                  blurRadius: 6.0, // radius blur bayangan
                  spreadRadius: 2.0, // sebaran bayangan
                ),
              ],
            ),
            child: StreamBuilder(
                stream: _stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> document =
                            snapshot.data.docs[index].data()
                                as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: green2Color,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/moon.png",
                                          width: 50,
                                        ),
                                        Text(
                                          document["descFeeling"],
                                          style: boldTextStyle.copyWith(
                                              color: greenColor),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        )
      ])),
    );
  }
}
