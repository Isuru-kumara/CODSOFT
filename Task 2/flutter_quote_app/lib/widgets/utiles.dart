import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteWidget extends StatelessWidget {
  var quote = "";
  var author = "";
  var onShareClick;
  var onLikeClick;
  var onNextClick;
  var onPrClick;
  var bgColor;

  QuoteWidget(
      {super.key,
      this.bgColor,
      required this.quote,
      required this.author,
      this.onNextClick,
      this.onPrClick,
      this.onShareClick,
      this.onLikeClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset(
            "assets/quote.png",
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            quote,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            author,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
