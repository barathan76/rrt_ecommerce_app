import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart' show Product;
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/wishlist_products_bloc/wishlist_products_bloc.dart';
// import 'package:rrt_ecommerce_app/data/product_model.dart';

import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/icon_text_gradient_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/custom_snackbar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_count.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_stars.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartBloc>();
    List<CartItem> cartItems = bloc.state.cartItems;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleIconButton(
              icon: Icons.shopping_cart,
              size: 25,
              color: Colors.black,
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => CartScreen()));
              },
            ),
          ),
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
                  headers: {"User-Agent": "Mozilla/5.0"},
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
              Text(
                product.title,
                style: mtextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                product.category,
                style: mtextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  RatingStars(rating: product.rating.rate, scale: 2),
                  RatingCount(count: product.rating.count, fontSize: 15),
                ],
              ),
              Text(
                '${product.price}',
                style: mtextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                'Product Details',
                style: mtextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                product.description,
                maxLines: 10,
                style: mtextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconTextGradientButton(
                    gradientColors: [
                      Color.fromARGB(255, 63, 146, 255),
                      Color.fromARGB(255, 11, 54, 137),
                    ],
                    text: 'Go to cart',
                    icon: Icons.shopping_cart,
                    onPressed: () {
                      if (!cartItems.contains(product as Object)) {
                        bloc.add(AddCartItemEvent(product: product));
                      }
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (ctx) => CartScreen()));
                    },
                  ),
                  SizedBox(width: 10),
                  IconTextGradientButton(
                    gradientColors: [
                      Color.fromARGB(255, 113, 249, 169),
                      Color.fromARGB(255, 49, 183, 105),
                    ],
                    text: 'Buy now',
                    icon: Icons.touch_app,
                    onPressed: () {
                      if (!cartItems.contains(product as Object)) {
                        bloc.add(AddCartItemEvent(product: product));
                        showSnackBar(context, content: 'Item added to cart');
                      } else {
                        showSnackBar(context, content: 'Item already in cart');
                      }
                    },
                  ),
                  BlocBuilder<WishlistProductsBloc, WishlistProductsState>(
                    builder: (context, wishlistState) {
                      final isWishlisted = wishlistState.wishlistedProducts.any(
                        (p) => p.id == product.id,
                      );
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<WishlistProductsBloc>(
                            context,
                          ).add(ToggleWishlistProduct(product.id, product));
                        },
                        icon: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          color: kRedColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
