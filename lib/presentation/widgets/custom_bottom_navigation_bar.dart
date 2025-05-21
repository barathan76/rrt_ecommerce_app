import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/wishlist/wishlist_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/bottom_navigation_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Base Navigation Bar
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavigationButton(
                icon: Icons.home_filled,
                text: 'Home',
                color: index == 0 ? authButtonColor : Colors.black,
                onPressed: () {
                  if (index == 0) {
                    return;
                  }
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => HomePage()));
                },
              ),
              BottomNavigationButton(
                icon: Icons.favorite_border,
                text: 'Wishlist',
                color: index == 1 ? authButtonColor : Colors.black,
                onPressed: () {
                  if (index == 1) {
                    return;
                  }
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => WishlistPage()));
                },
              ),
              SizedBox(width: 30), // Space for the floating cart icon
              BottomNavigationButton(
                icon: Icons.search,
                text: 'Search',
                color: index == 3 ? authButtonColor : Colors.black,
                onPressed: () {},
              ),
              BottomNavigationButton(
                icon: Icons.settings,
                text: 'Settings',
                color: index == 4 ? authButtonColor : Colors.black,
                onPressed: () {
                  if (index == 4) {
                    return;
                  }
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => ProfilePage()));
                },
              ),
            ],
          ),
        ),
        // Floating Cart Icon
        Positioned(
          top: -10,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: GestureDetector(
            onTap:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => CartScreen())),
            child: Container(
              width: 60,
              height: 60,

              decoration: BoxDecoration(
                boxShadow:
                    index != 2
                        ? [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.normal,
                            color: const Color.fromARGB(255, 204, 200, 200),
                          ),
                        ]
                        : null,
                color: index == 2 ? authButtonColor : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: index == 2 ? Colors.white : Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
