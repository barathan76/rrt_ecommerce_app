import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/address.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onRemove,
  });
  final void Function() onEdit;
  final void Function() onRemove;

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [greyBoxShadow],
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  address.name,
                  style: mtextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 224, 224),
                  ),
                  child: Text(
                    style: mtextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    address.addressType == AddressType.home ? 'Home' : 'Work',
                  ),
                ),
              ],
            ),
            Text(
              '${address.addressLine1} ${address.addressLine2} ${address.city} ${address.state} ${address.pincode}',
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${address.number}'),
                Row(
                  spacing: 2,
                  children: [
                    TextButton(
                      onPressed: onEdit,

                      child: Text(
                        "Edit",
                        style: mtextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onRemove,
                      child: Text(
                        "Remove",
                        style: mtextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
