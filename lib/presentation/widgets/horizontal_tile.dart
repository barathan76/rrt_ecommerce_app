import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/presentation/pages/details/product_details.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/rating_stars.dart';

class HorizontalTile extends StatelessWidget {
  const HorizontalTile({super.key, required this.product});
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.white,
        ),
        width: 120, // Set a fixed width
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,

                height: 80,
                fit: BoxFit.contain,
              ),
            ),

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
            RatingStars(rating: product.rating, scale: 1),
          ],
        ),
      ),
    );
  }
}
