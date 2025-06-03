import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_item_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_confirmation/order_confirmation_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/cart_bottom_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  double getTotalAmount(List<CartItem> cartItems) {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.quantity * item.product.price;
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
            Icon(Icons.shopping_bag, size: 40, color: kRedColor),
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final bloc = context.watch<CartBloc>();

          List<CartItem> cartItems = bloc.state.cartItems;
          if (state is CartFailure) {
            return Center(child: Text(state.msg));
          }
          if (cartItems.isEmpty) {
            return content;
          } else {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder:
                          (context, index) => CartItemTile(
                            onMinus: () {
                              bloc.add(
                                UpdateCartItemEvent(
                                  index: index,
                                  quantity: cartItems[index].quantity - 1,
                                  productId: cartItems[index].product.id,
                                ),
                              );
                            },
                            onAdd: () {
                              bloc.add(
                                UpdateCartItemEvent(
                                  index: index,
                                  quantity: cartItems[index].quantity + 1,
                                  productId: cartItems[index].product.id,
                                ),
                              );
                            },
                            onRemove: () {
                              bloc.add(
                                RemoveCartItemEvent(
                                  index: index,
                                  productId: cartItems[index].product.id,
                                ),
                              );
                            },
                            item: cartItems[index],
                          ),
                    ),
                  ),
                  CartBottomAppBar(
                    totalAmount: getTotalAmount(cartItems),
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
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 2),
    );
  }
}
