import 'package:cart_repository/cart_repository.dart' hide Order;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/order_bloc/order_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/select_address_bloc/select_address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/wishlist_products_bloc/wishlist_products_bloc.dart';

import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/main_scaffold.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_item_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_confirmation/address_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/cart_bottom_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/dialogs/order_confimation_dialog.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  double getTotalAmount(List<CartItem> cartItems) {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.quantity * item.product.price;
    }
    return total;
  }

  void _redirectToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => MainScaffold()),
      (Route<dynamic> route) => false,
    );
  }

  void _showOrderSuccessDialog(BuildContext context, List<CartItem> cartItems) {
    final address =
        BlocProvider.of<SelectAddressBloc>(context).state.userAddress;

    if (address == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(title: Text("Select an address")),
      );
      return;
    }
    BlocProvider.of<OrderBloc>(
      context,
    ).add(PlaceOrderEvent(cartItems, address));
    BlocProvider.of<CartBloc>(context).add(ClearCartEvent());
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Scaffold()));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          if (context.mounted) {
            _redirectToHome(context);
          }
        });
        return orderConfirmationDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text('No items in cart'));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: mtextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: kRedColor,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final bloc = context.watch<CartBloc>();

          List<CartItem> cartItems = bloc.state.cartItems;
          if (cartItems.isEmpty) {
            return Center(child: content);
          }

          return Column(
            children: [
              BlocBuilder<SelectAddressBloc, SelectAddressState>(
                builder:
                    (context, state) => AddressBar(address: state.userAddress),
              ),
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
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('Do you need to add to wishlist'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        BlocProvider.of<WishlistProductsBloc>(
                                          context,
                                        ).add(
                                          AddWishlistProduct(
                                            cartItems[index].product.id,
                                          ),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('No'),
                                    ),
                                  ],
                                ),
                          ).then((shouldRemove) {
                            bloc.add(
                              RemoveCartItemEvent(
                                index: index,
                                productId: cartItems[index].product.id,
                              ),
                            );
                          });
                        },
                        item: cartItems[index],
                      ),
                ),
              ),
              kOutlineNSContainer(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Delivery\n',
                        style: mtextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Cash on Delivery',
                        style: mtextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CartBottomAppBar(
                totalAmount: getTotalAmount(cartItems),
                onPressed: () {
                  _showOrderSuccessDialog(context, cartItems);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
