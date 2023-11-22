import 'package:flutter/material.dart';
import 'package:soul_serenity/theme.dart';

class EveningPre4 extends StatelessWidget {
  const EveningPre4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 50),
         Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/tree.png", width: 360),
            Positioned(
              right: 10,
              bottom: 80, // Sesuaikan posisi teks di dalam gambar
              child: Text(
                "GOOD JOB!",
                style: boldTextStyle.copyWith(color: greenColor,fontSize: 20,letterSpacing: 10) 
              ),
            ),
          ],
        ),
         Text("You've Completed your Evening Reflection",style: lightTextStyle.copyWith(color: greenColor,fontSize: 14)),
         SizedBox(height: 130),
         Container(
          width: MediaQuery.of(context).size.width - 350,
          height: 40,
           child: OutlinedButton(
            onPressed: () {
         
            },
            child: Text("Finish",style: boldTextStyle),
            style: OutlinedButton.styleFrom(
            foregroundColor: greenColor, // Warna teks
            side: BorderSide(color: greenColor, width: 2),
            backgroundColor: green2Color, // Warna border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
                 ),
           ),
         )        
      ],
    );
  }
}