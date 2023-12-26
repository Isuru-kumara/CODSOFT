import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.black),
                ),
                children: const [
                  TextSpan(
                      text: "How do you want to be called?",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 13, 0, 88),
                  onPrimary: Colors.white,
                ),
                child: const Text("Continue"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
