import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 40;
    double width = 40;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                "assets/welcom.jpg",
                height: 320,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 50, color: Colors.black),
                ),
                children: const [
                  TextSpan(text: "Let's\n"),
                  TextSpan(
                      text: "Make motivation work for you",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 13, 0, 88),
                  onPrimary: Colors.white,
                ),
                child: const Text("Let's Go"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
