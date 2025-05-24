import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/adress_data.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_details.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_tile.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Addresses',
          style: mtextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (ctx) => AddressDetails(
                          onSubmit: (x) {
                            setState(() {
                              addressesList.add(x);
                            });
                          },
                        ),
                  ),
                );
              },
              label: Text(
                'Add a new address',
                style: mtextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: authButtonColor,
                ),
              ),
              icon: Icon(Icons.add),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  addressesList.isEmpty
                      ? Center(child: Text("No address saved"))
                      : ListView.builder(
                        itemCount: addressesList.length,
                        itemBuilder:
                            (context, index) => AddressTile(
                              address: addressesList[index],
                              onEdit: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (ctx) => AddressDetails(
                                          title: 'Edit delivery address',
                                          address: addressesList[index],
                                          onSubmit: (x) {
                                            setState(() {
                                              addressesList.removeAt(index);
                                              addressesList.insert(index, x);
                                            });
                                          },
                                        ),
                                  ),
                                );
                              },
                              onRemove: () {
                                setState(() {
                                  addressesList.removeAt(index);
                                });
                              },
                            ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
