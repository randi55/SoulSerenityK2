import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/pages/privacy.dart';
import 'package:soul_serenity/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  signUp() async {
    try {
      //Membuat akun baru
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Fluttertoast.showToast(
          msg: "You have succesfully created an account, Log In Now",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);

      // Menambahkan detail akun
      addUserDetails();

      // addUserDetails(
      //     _fullNameController.text.trim(), _emailController.text.trim());
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message!,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  addUserDetails() async {
    CollectionReference collRef = FirebaseFirestore.instance.collection('User');
    collRef.add({
      'fullName': _fullNameController.text,
      'email': _emailController.text,
    });

    // await FirebaseFirestore.instance.collection('User').add({
    //   'fullName': fullName,
    //   'email': email,
    // });
  }

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //TOP BAR
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, left: 15, right: 15, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 55,
                        // height: 55,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MorningPre2()));
                            },
                            child: Image.asset(
                              "assets/back.png",
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: greenColor,
                              backgroundColor: green2Color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                      ),
                      Image.asset("assets/logo.png", width: 60),
                    ],
                  ),
                ),

                // WELCOME
                Text("WELCOME",
                    style: boldTextStyle.copyWith(
                        color: greenColor, fontSize: 24, letterSpacing: 12)),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text("Create an account to",
                        style: regulerTextStyle.copyWith(
                            color: greenColor, fontSize: 14)),
                    Text("save your progress",
                        style: regulerTextStyle.copyWith(
                            color: greenColor, fontSize: 14)),
                  ],
                ),

                // FULLNAME TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Full Name",
                        style: regulerTextStyle.copyWith(color: greenColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: green2Color,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _fullNameController,
                        style: regulerTextStyle.copyWith(color: greenColor),
                        cursorColor: greenColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Insert Full Name",
                            hintStyle: regulerTextStyle.copyWith(
                              color: greenColor.withOpacity(0.5),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                //EMAIL TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Email",
                        style: regulerTextStyle.copyWith(color: greenColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: green2Color,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        style: regulerTextStyle.copyWith(color: greenColor),
                        cursorColor: greenColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Insert Email",
                            hintStyle: regulerTextStyle.copyWith(
                              color: greenColor.withOpacity(0.5),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                //PASSWORD TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Password",
                        style: regulerTextStyle.copyWith(
                            color: greenColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: green2Color,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        style: regulerTextStyle.copyWith(color: greenColor),
                        obscureText: _secureText,
                        cursorColor: greenColor,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: _secureText
                                  ? Icon(
                                      Icons.visibility,
                                      size: 20,
                                      color: greenColor,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                      color: greenColor,
                                    ),
                            ),
                            border: InputBorder.none,
                            hintText: "Insert Password",
                            hintStyle: regulerTextStyle.copyWith(
                                color: greenColor.withOpacity(0.5),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //SIGNUP BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 220,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: green2Color,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: boldTextStyle.copyWith(color: greenColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // TERMS OF USE
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By clicking Create Account, you agree",
                      style: regulerTextStyle.copyWith(color: greenColor),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "to our ",
                        style: regulerTextStyle.copyWith(color: greenColor),
                        children: [
                          TextSpan(
                            text: "Terms of Use",
                            style: boldTextStyle.copyWith(
                              color: greenColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPage(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: " and ",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: boldTextStyle.copyWith(
                              color: greenColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPage(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: ".",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 90),

                //CREATE ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an Account?",
                      style: boldTextStyle.copyWith(
                          color: greenColor, fontSize: 16),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          " Log In",
                          style: boldTextStyle.copyWith(
                              color: greenColor,
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
