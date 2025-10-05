import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/products_bloc/products_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/pages/search/search_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/home_app_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/grid_product_view.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/products_view/horizontal_product_list.dart';
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
              InkWell(
                child: IgnorePointer(child: SearchBarField()),
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (ctx) => SearchPage())),
              ),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return SizedBox(
                      height: 500,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ProductsLoaded) {
                    return Column(
                      children: [
                        HorizontalListView(productList: state.productsList),
                        GridProductView(products: state.productsList),
                        // StaggeredVerticalGridView(productsData: state.productsList),
                      ],
                    );
                  } else if (state is ProductsFailure) {
                    return SizedBox(
                      height: 500,
                      child: Center(
                        child: Text(
                          'Unable to get products',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: Text(
                        'Error in loading',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar removed for static navigation
    );
  }
}
