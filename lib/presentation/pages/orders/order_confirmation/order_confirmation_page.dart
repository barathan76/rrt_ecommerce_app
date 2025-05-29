import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/adress_data.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/data/ordes_data.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_item_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_confirmation/address_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/cart_bottom_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/dialogs/order_confimation_dialog.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  double get totalAmount {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.count * item.product.price;
    }
    return total;
  }

  void _redirectToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => HomePage()),
      (Route<dynamic> route) => false,
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    ordersList.add(
      Order(
        cartItems: cartItems,
        amount: totalAmount,
        address: addressesList[0],
        statusMap: initStatusMap(cartItems),
        currentStatusMap: initCurrentStatus(cartItems),
      ),
    );
    setState(() {
      cartItems = [];
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Scaffold()));
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
      body: Column(
        children: [
          AddressBar(address: addressesList[0]),
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
            totalAmount: totalAmount,
            onPressed: () {
              _showOrderSuccessDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
