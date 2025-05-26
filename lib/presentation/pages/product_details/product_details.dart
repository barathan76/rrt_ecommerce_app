import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/data/wishlist_data.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/icon_text_gradient_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_count.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_stars.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
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
                if (!cartItems.contains(widget.product as Object)) {
                  setState(() {
                    cartItems.add(CartItem(product: widget.product, count: 1));
                  });
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Item added to cart")));
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Item already in cart")),
                  );
                }
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
                  widget.product.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                widget.product.title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                widget.product.category,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  RatingStars(rating: widget.product.rating.rate, scale: 2),
                  RatingCount(count: widget.product.rating.count, fontSize: 15),
                ],
              ),
              Text(
                '${widget.product.price}',
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
                widget.product.description,
                maxLines: 10,
                style: GoogleFonts.montserrat(
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
                      if (!cartItems.contains(widget.product as Object)) {
                        setState(() {
                          cartItems.add(
                            CartItem(product: widget.product, count: 1),
                          );
                        });
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
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.product.wishlist = !widget.product.wishlist;
                        if (widget.product.wishlist) {
                          wishlistData.add(widget.product);
                        } else if (wishlistData.contains(widget.product)) {
                          wishlistData.remove(widget.product);
                        }
                      });
                    },
                    icon: Icon(
                      widget.product.wishlist
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: authButtonColor,
                    ),
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
