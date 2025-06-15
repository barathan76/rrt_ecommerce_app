import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/order_bloc/order_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/my_orders/order_tile.dart'
    show OrderTile;
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCS(title: 'My Orders'),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OrderFailure) {
            return Center(child: Text(state.msg));
          } else if (state is OrderLoaded || state is OrderUpdated) {
            if (state.orders.isEmpty) {
              return Center(child: Text("Nothinig here"));
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SearchBarField(),
                      ListView.builder(
                        itemCount: state.orders.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (context, index) =>
                                OrderTile(order: state.orders[index]),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
          return Center(child: Text("Nothinig here"));
        },
      ),
    );
  }
}
