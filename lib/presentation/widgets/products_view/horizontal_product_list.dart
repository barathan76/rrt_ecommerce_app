import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart' show Product;
// import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/horizontal_tile.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key, required this.productList});
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return HorizontalTile(product: productList[index]);
        },
      ),
    );
  }
}
