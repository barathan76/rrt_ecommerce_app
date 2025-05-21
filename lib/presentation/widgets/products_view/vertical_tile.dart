import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/presentation/pages/product_details/product_details.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_count.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_stars.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetails(product: product),
            ),
          ),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(product.imageUrl),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.description,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      RatingStars(rating: product.rating.rate, scale: 1),
                      RatingCount(count: product.rating.count, fontSize: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
