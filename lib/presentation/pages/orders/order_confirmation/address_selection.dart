import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/address_bloc/address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/select_address_bloc/select_address_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_details.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_tile.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';

class AddressSelection extends StatelessWidget {
  const AddressSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Address',
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
                            BlocProvider.of<AddressBloc>(
                              context,
                            ).add(AddAddressEvent(address: x));
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
                  color: kRedColor,
                ),
              ),
              icon: Icon(Icons.add),
            ),
          ),
          Expanded(
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, addressState) {
                if (addressState.addressList.isEmpty) {
                  return Center(child: Text("No address saved"));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<SelectAddressBloc, SelectAddressState>(
                      builder: (context, state) {
                        final selectedId = state.userAddress?.id;
                        return ListView.builder(
                          itemCount: addressState.addressList.length,
                          itemBuilder: (context, index) {
                            final address = addressState.addressList[index];
                            return ListTile(
                              leading: Radio<int>(
                                value: address.id!,
                                groupValue: selectedId,
                                onChanged: (_) {
                                  context.read<SelectAddressBloc>().add(
                                    ChangeSelectAddressEvent(address),
                                  );
                                },
                              ),

                              title: AddressTile(
                                address: address,
                                onEdit: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (ctx) => AddressDetails(
                                            title: 'Edit delivery address',
                                            address: address,
                                            onSubmit: (x) {
                                              BlocProvider.of<AddressBloc>(
                                                context,
                                              ).add(
                                                UpdateAddressEvent(
                                                  address: x,
                                                  id: address.id!,
                                                ),
                                              );
                                            },
                                          ),
                                    ),
                                  );
                                },
                                onRemove: () {
                                  context.read<AddressBloc>().add(
                                    DeleteAddressEvent(id: address.id!),
                                  );
                                  if (selectedId == address.id) {
                                    context.read<SelectAddressBloc>().add(
                                      ChangeSelectAddressEvent(null),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),

          BlocBuilder<SelectAddressBloc, SelectAddressState>(
            builder: (context, state) {
              if (state.userAddress != null) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SubmitButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Select Address',
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
