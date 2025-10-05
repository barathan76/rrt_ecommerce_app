import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart' show Product;
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
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
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: mtextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: mtextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${product.price}',
                    style: mtextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
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
