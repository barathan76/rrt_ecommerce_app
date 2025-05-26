import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_item_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_confirmation/order_confirmation_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/custom_outlined_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/custom_bottom_navigation_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalAmount {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.count * item.product.price;
    }
    return total;
  }

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
                              onMinus: () {
                                setState(() {
                                  cartItems[index].count--;
                                });
                              },
                              onAdd: () {
                                setState(() {
                                  cartItems[index].count++;
                                });
                              },
                              onRemove: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                              item: cartItems[index],
                            ),
                      ),
                    ),
                    BottomAppBar(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount : $totalAmount'),
                          CustomOutlinedButton(
                            title: 'Place Order',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => OrderConfirmationPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 2),
    );
  }
}
