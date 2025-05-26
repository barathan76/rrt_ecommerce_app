import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/home_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/horizontal_product_list.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/staggered_vertical_grid_view.dart';
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
            children: [
              SearchBarField(),
              HorizontalListView(productList: productsData),
              StaggeredVerticalGridView(productsData: productsData),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
    );
  }
}

//  productsData
//                           .map((x) => VerticalTile(product: x))
//                           .toList(),
