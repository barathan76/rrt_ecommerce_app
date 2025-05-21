import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/home_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/horizontal_tile.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/staggered_vertical_grid_view.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SearchBarField(),
            Container(
              height: 180,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productsData.length,
                itemBuilder: (context, index) {
                  return HorizontalTile(product: productsData[index]);
                },
              ),
            ),
            Expanded(
              child: StaggeredVerticalGridView(productsData: productsData),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
    );
  }
}

//  productsData
//                           .map((x) => VerticalTile(product: x))
//                           .toList(),
