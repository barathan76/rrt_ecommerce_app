import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: mtextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: authButtonColor,
        ),
      ),
      actions: [
        CircleIconButton(
          icon: Icons.search,
          size: 20,
          color: Colors.black,
          onPressed: () {},
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CircleIconButton(
            icon: Icons.shopping_cart,
            size: 20,
            color: Colors.black,
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => CartScreen()));
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
