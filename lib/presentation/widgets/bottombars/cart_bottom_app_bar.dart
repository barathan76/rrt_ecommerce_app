import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/custom_outlined_button.dart';

class CartBottomAppBar extends StatelessWidget {
  const CartBottomAppBar({
    super.key,
    required this.totalAmount,
    required this.onPressed,
  });

  final double totalAmount;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Amount : ${totalAmount.toStringAsFixed(2)}'),
          CustomOutlinedButton(title: 'Place Order', onPressed: onPressed),
        ],
      ),
    );
  }
}
