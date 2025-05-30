import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/pages/search/search_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';

class AppBarCS extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCS({super.key, required this.title, this.style});
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            style ??
            mtextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kRedColor,
            ),
      ),
      actions: [
        CircleIconButton(
          icon: Icons.search,
          size: 20,
          color: Colors.black,
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => SearchPage()));
          },
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
