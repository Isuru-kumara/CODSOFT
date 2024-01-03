import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                  children: const [
                    TextSpan(
                      text: "How do you want to be called?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/profile.jpg",
                  height: 500,
                  width: 500,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: "Your Name"),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CategoryPage()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 13, 0, 88),
                    onPrimary: Colors.white,
                  ),
                  child: const Text("Continue"),
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
