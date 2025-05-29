import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/wishlist_data.dart';
import 'package:rrt_ecommerce_app/presentation/pages/search/search_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/home_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/staggered_vertical_grid_view.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              InkWell(
                child: IgnorePointer(child: SearchBarField()),
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (ctx) => SearchPage())),
              ),
              SizedBox(height: 10),
              wishlistData.isNotEmpty
                  ? StaggeredVerticalGridView(productsData: wishlistData)
                  : SizedBox(
                    height: 500,
                    child: Center(child: Text("No items are wishlisted")),
                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
    );
  }
}
