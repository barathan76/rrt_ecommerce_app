import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:products_repository/products_repository.dart' show Product;
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/vertical_tile.dart';

class StaggeredVerticalGridView extends StatelessWidget {
  const StaggeredVerticalGridView({
    super.key,
    required this.productsData,
    this.isScroll = false,
  });
  final List<Product> productsData;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const tileWidth = 150;
    final crossAxisCount = (screenWidth / tileWidth).floor();
    final int count = productsData.length;
    return MasonryGridView.builder(
      physics: isScroll ? null : NeverScrollableScrollPhysics(),
      itemCount: count,
      shrinkWrap: true,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) {
        return VerticalTile(product: productsData[index]);
      },
    );
  }
}
