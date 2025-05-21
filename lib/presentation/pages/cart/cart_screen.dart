import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_item_tile.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/custom_bottom_navigation_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text('No items in cart'));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_bag, size: 40, color: authButtonColor),
            SizedBox(width: 5),
            Text(
              'Your Cart',
              style: mtextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body:
          cartItems.isEmpty
              ? content
              : Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder:
                            (context, index) => CartItemTile(
                              onRemove: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                              item: cartItems[index],
                            ),
                      ),
                    ),
                  ],
                ),
              ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 2),
    );
  }
}
