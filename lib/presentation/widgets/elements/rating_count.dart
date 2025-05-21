import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingCount extends StatelessWidget {
  const RatingCount({super.key, required this.count, required this.fontSize});

  final double count;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '$count',
        style: GoogleFonts.montserrat(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 164, 169, 179),
        ),
      ),
    );
  }
}
