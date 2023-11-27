import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soul_serenity/pages/forgot_password.dart';
import 'package:soul_serenity/pages/landing_page.dart';
import 'package:soul_serenity/pages/signup_page.dart';
import 'package:soul_serenity/theme.dart';
import 'package:soul_serenity/pages/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  signIn() async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    } on FirebaseAuthException {
      Fluttertoast.showToast(
        msg: "Incorrect Email or Password",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void dispose() {
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
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
                Text("Log into your account",
                    style: regulerTextStyle.copyWith(
                        color: greenColor, fontSize: 14)),

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

                //FORGOT PASSWORD
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: boldTextStyle.copyWith(
                          color: greenColor,
                          decoration: TextDecoration.underline,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //SIGNIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 220,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: green2Color,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Sign In",
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
                      "Your use of SoulSerenity is subject to",
                      style: regulerTextStyle.copyWith(color: greenColor),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "our ",
                        style: regulerTextStyle.copyWith(color: greenColor),
                        children: [
                          TextSpan(
                            text: "Terms of Use",
                            style: boldTextStyle.copyWith(color: greenColor),
                          ),
                          TextSpan(
                            text: " and ",
                            style: regulerTextStyle.copyWith(color: greenColor),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: boldTextStyle.copyWith(color: greenColor),
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

                SizedBox(height: 160),

                //CREATE ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Need an Account?",
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
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          " Sign Up",
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
