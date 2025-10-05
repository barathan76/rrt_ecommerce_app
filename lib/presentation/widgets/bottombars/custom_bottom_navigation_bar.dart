import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/bottom_navigation_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTabSelected,
  });
  final int index;
  final void Function(int) onTabSelected;

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
                color: index == 0 ? kRedColor : Colors.black,
                onPressed: () => onTabSelected(0),
              ),
              BottomNavigationButton(
                icon: Icons.favorite_border,
                text: 'Wishlist',
                color: index == 1 ? kRedColor : Colors.black,
                onPressed: () => onTabSelected(1),
              ),
              SizedBox(width: 30), // Space for the floating cart icon
              BottomNavigationButton(
                icon: Icons.search,
                text: 'Search',
                color: index == 3 ? kRedColor : Colors.black,
                onPressed: () => onTabSelected(3),
              ),
              BottomNavigationButton(
                icon: Icons.settings,
                text: 'Settings',
                color: index == 4 ? kRedColor : Colors.black,
                onPressed: () => onTabSelected(4),
              ),
            ],
          ),
        ),
        // Floating Cart Icon
        Positioned(
          top: -10,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: GestureDetector(
            onTap: () => onTabSelected(2),
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
                color: index == 2 ? kRedColor : Colors.white,
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
