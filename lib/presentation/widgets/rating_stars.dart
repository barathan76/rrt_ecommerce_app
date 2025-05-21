import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/data/rating_model.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, required this.scale});
  final Rating rating;
  final double scale;
  @override
  Widget build(BuildContext context) {
    int filled = rating.rate.floor();
    int ceil = rating.rate.ceil();
    int half = ceil - filled;
    int rem = 5 - half - filled;
    double dim = 10 * scale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < filled; i++)
          Icon(Icons.star, color: Color.fromARGB(255, 237, 179, 16), size: dim),
        if (half > 0)
          Icon(Icons.star_half_outlined, color: Colors.grey, size: dim),
        for (int i = 0; i < rem; i++)
          Icon(Icons.star_outline, color: Colors.grey, size: dim),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '${rating.count}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 164, 169, 179),
            ),
          ),
        ),
      ],
    );
  }
}
