import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart' show Product;
import 'package:rrt_ecommerce_app/data/products_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/home_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/staggered_vertical_grid_view.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<Product> searchList = [];

  @override
  void initState() {
    controller.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = controller.text.toLowerCase();
    if (query.isNotEmpty) {
      setState(() {
        searchList =
            productsData.where((product) {
              return product.title.toLowerCase().contains(query);
            }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SearchBarField(controller: controller),

            Expanded(
              child:
                  searchList.isEmpty && controller.text.isEmpty
                      ? Center(child: Text("Search"))
                      : controller.text.isNotEmpty && searchList.isEmpty
                      ? Center(child: Text("No items available"))
                      : StaggeredVerticalGridView(
                        productsData: searchList,
                        isScroll: true,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
