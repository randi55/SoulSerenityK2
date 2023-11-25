import 'package:flutter/material.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/theme.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
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
                  Image.asset("assets/logo.png", width: 60),
                ],
              ),
            ),
            //
            Text(
              'Soul Serenity Application - Version 1.0',
              style: boldTextStyle,
            ),
            Text(
              'Last Updated: November 24th, 2023',
              style: boldTextStyle,
            ),
            Text(
                'These Terms of Use govern your use of the Soul Serenity application provided by Soul Serenity, Inc. By accessing or using the Application, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the Application.'),
            const SizedBox(height: 16.0),
            Text(
              'Acceptance of Terms',
              style: boldTextStyle,
            ),
            Text('Personal Information:'),
            Text(
                'By using the Soul Serenity application, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, you may not use the Application.'),
            const SizedBox(height: 24.0),
            Text(
              'License',
              style: boldTextStyle,
            ),
            Text(
                'Subject to your compliance with these Terms, we grant you a limited, non-exclusive, non-transferable, revocable license to use the Soul Serenity Application for your personal, non-commercial use.'),
            const SizedBox(height: 24.0),
            Text(
              'User Accounts',
              style: boldTextStyle,
            ),
            Text(
                'To use certain features of the Soul Serenity Application, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.'),
            const SizedBox(height: 24.0),
            Text(
              'Content',
              style: boldTextStyle,
            ),
            Text(
                'You acknowledge and agree that all content available through the Application is the sole property of Soul Serenity or its licensors. You may not modify, reproduce, distribute, or create derivative works based on any content without the express consent of Soul Serenity.'),
            const SizedBox(height: 24.0),
            Text(
              'Prohibited Conduct',
              style: boldTextStyle,
            ),
            Text('You agree not to:'),
            Text('a. Violate any applicable laws or regulations'),
            Text(
                'b. Use the Application for any unlawful or unauthorized purpose'),
            Text(
                'c. Interfere with or disrupt the operation of the Application'),
            Text('d. Transmit any viruses or other harmful code'),
            Text(
                'e. Engage in any form of automated data collection, including scraping '),
            Text('or crawling the Application.'),
            const SizedBox(height: 24.0),
            Text(
              'Privacy',
              style: boldTextStyle,
            ),
            Text(
                'Your use of the Application is also governed by our Privacy Policy, which is incorporated by reference into these Terms.'),
            const SizedBox(height: 24.0),
            Text(
              'Contact Information:',
              style: boldTextStyle,
            ),
            Text(
                'If you have any questions about these Terms, please contact us at soulserenity@gmail.com'),
            Text('Thank you for using Soul Serenity!')
          ],
        ),
      ),
    );
  }
}
