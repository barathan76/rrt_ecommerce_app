import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/vertical_tile.dart';

class StaggeredVerticalGridView extends StatelessWidget {
  const StaggeredVerticalGridView({super.key, required this.productsData});
  final List<Product> productsData;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const tileWidth = 150;
    final crossAxisCount = (screenWidth / tileWidth).floor();
    return Expanded(
      child: MasonryGridView.builder(
        itemCount: productsData.length,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (context, index) {
          return VerticalTile(product: productsData[index]);
        },
      ),
    );
  }
}
