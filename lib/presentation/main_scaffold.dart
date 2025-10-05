import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/cart/cart_screen.dart';
import 'package:rrt_ecommerce_app/presentation/pages/search/search_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/setting_main/settings_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/wishlist/wishlist_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    WishlistPage(),
    CartScreen(),
    SearchPage(),
    SettingsPage(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        index: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
