import 'package:flutter/material.dart';

import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/ordersWithBloc/order_confirmation/address_selection.dart';
import 'package:user_repository/user_repository.dart'
    show AddressType, UserAddress;

class AddressBar extends StatelessWidget {
  const AddressBar({super.key, required this.address});
  final UserAddress? address;
  @override
  Widget build(BuildContext context) {
    return kOutlineContainer(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Deliver To:'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddressSelection()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: const Color.fromARGB(255, 189, 189, 189),
                  ),
                ),
                child: Text("Change"),
              ),
            ],
          ),
          address == null
              ? Center(
                child: Text(
                  "No address available or selected",
                  style: mtextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address!.name,
                        style: mtextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 224, 224),
                        ),
                        child: Text(
                          style: mtextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          address!.addressType == AddressType.home
                              ? 'Home'
                              : 'Work',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${address!.addressLine1} ${address!.addressLine2} ${address!.city} ${address!.state} ${address!.pincode}',
                    maxLines: 3,
                  ),
                  Text(address!.number),
                ],
              ),
        ],
      ),
    );
  }
}
