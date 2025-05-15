import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: ' Search any Product...',
        hintStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 187, 187, 187),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.search, color: Color.fromARGB(255, 187, 187, 187)),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic_none,
              color: Color.fromARGB(255, 187, 187, 187),
            ),
          ),
        ),
      ),
    );
  }
}
