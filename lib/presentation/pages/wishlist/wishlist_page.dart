import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/wishlist_products_bloc/wishlist_products_bloc.dart';
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
      body: BlocBuilder<WishlistProductsBloc, WishlistProductsState>(
        builder: (context, state) {
          if (state.wishlistedProducts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  InkWell(
                    child: IgnorePointer(child: SearchBarField()),
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => SearchPage()),
                        ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: StaggeredVerticalGridView(
                      productsData: state.wishlistedProducts,
                      isScroll: true,
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text("No products are wishlisted"));
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
    );
  }
}
