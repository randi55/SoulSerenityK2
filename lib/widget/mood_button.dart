import 'package:flutter/material.dart';
import 'package:soul_serenity/theme.dart';

class MoodButton extends StatefulWidget {
  const MoodButton({super.key});

  @override
  State<MoodButton> createState() => _MoodButtonState();
}

class _MoodButtonState extends State<MoodButton> {
  String currentImage = "assets/emote1.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: green2Color,
              borderRadius: BorderRadius.circular(20)
          ),
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
                        borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Image.asset("assets/emote2.png"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Image.asset("assets/emote3.png"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Image.asset("assets/emote4.png"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Image.asset("assets/emote5.png"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
