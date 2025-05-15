import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/bottom_navigation_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/home_app_bar.dart';

import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SearchBarField()],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // Base Navigation Bar
          Container(
            height: 60,
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
                  onPressed: () {},
                ),

                BottomNavigationButton(
                  icon: Icons.favorite_border,
                  text: 'Wishlist',
                  onPressed: () {},
                ),
                SizedBox(width: 30), // Space for the floating cart icon
                BottomNavigationButton(
                  icon: Icons.search,
                  text: 'Search',
                  onPressed: () {},
                ),
                BottomNavigationButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  onPressed: () {
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
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: authButtonColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Icon(Icons.shopping_cart, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
