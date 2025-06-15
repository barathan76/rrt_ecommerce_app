import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/vertical_tile.dart';

class GridProductView extends StatelessWidget {
  const GridProductView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const tileWidth = 150;
    final crossAxisCount = (screenWidth / tileWidth).floor();
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      childAspectRatio: 0.9,
      children: [
        ...products.map((x) => VerticalTile(product: x, imageSize: 100)),
      ],
    );
  }
}
