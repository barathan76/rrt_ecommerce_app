import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/rating_stars.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 10, color: Colors.white),
                ),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                product.title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                product.category,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              RatingStars(rating: product.rating, scale: 2),
              Text(
                '${product.price}',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                'Product Details',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                product.description,
                maxLines: 10,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
