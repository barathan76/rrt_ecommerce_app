import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/search_products_bloc/search_products_bloc.dart';
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
    if (query.isEmpty) {
      BlocProvider.of<SearchProductsBloc>(context).add(EmptySearchProducts());
    }
    if (query.isNotEmpty) {
      BlocProvider.of<SearchProductsBloc>(
        context,
      ).add(SearchProductsByTitle(query));
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
              child: BlocBuilder<SearchProductsBloc, SearchProductsState>(
                builder: (context, state) {
                  if (state is SearchProductsLoaded) {
                    if (controller.text.isEmpty) {
                      return Center(child: Text("Search"));
                    } else if (state.productsList.isEmpty) {
                      return Center(child: Text("No items available"));
                    }
                    return StaggeredVerticalGridView(
                      productsData: state.productsList,
                      isScroll: true,
                    );
                  } else if (state is SearchProductsFailure) {
                    return Center(child: Text("Sorry, unable to fetch"));
                  } else if (state is SearchProductsLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(child: Text("Search Products"));
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar removed for static navigation
    );
  }
}
