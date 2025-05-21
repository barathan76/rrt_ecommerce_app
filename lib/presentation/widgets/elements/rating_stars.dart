import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, required this.scale});
  final double rating;
  final double scale;
  @override
  Widget build(BuildContext context) {
    int filled = rating.floor();
    int ceil = rating.ceil();
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
      ],
    );
  }
}
