import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/address_bloc/address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/select_address_bloc/select_address_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_details.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_tile.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/services/snack_bar_msg.dart';
import 'package:user_repository/user_repository.dart';

class AddressSelection extends StatefulWidget {
  const AddressSelection({super.key});

  @override
  State<AddressSelection> createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  int? selectedIndex;
  List<UserAddress> addressList = [];
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<AddressBloc, AddressState>(
                listener: (context, state) {
                  if (state is AddressFailure) {
                    showErrorMsg(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is AddressLoaded || state is AddressListUpdated) {
                    if (state is AddressLoaded) {
                      addressList = state.addressList;
                    } else if (state is AddressListUpdated) {
                      addressList = state.addressList;
                    }
                    return addressList.isEmpty
                        ? Center(child: Text("No address saved"))
                        : ListView.builder(
                          itemCount: addressList.length,
                          itemBuilder:
                              (context, index) => ListTile(
                                leading: Radio<int>(
                                  value: index,
                                  groupValue: selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedIndex = value;
                                    });
                                  },
                                ),

                                title: AddressTile(
                                  address: addressList[index],
                                  onEdit: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (ctx) => AddressDetails(
                                              title: 'Edit delivery address',
                                              address: addressList[index],
                                              onSubmit: (x) {
                                                BlocProvider.of<AddressBloc>(
                                                  context,
                                                ).add(
                                                  UpdateAddressEvent(
                                                    address: x,
                                                    id: addressList[index].id!,
                                                  ),
                                                );
                                              },
                                            ),
                                      ),
                                    );
                                  },
                                  onRemove: () {
                                    BlocProvider.of<AddressBloc>(context).add(
                                      DeleteAddressEvent(
                                        id: addressList[index].id!,
                                      ),
                                    );
                                    setState(() {
                                      selectedIndex = null;
                                    });
                                  },
                                ),
                              ),
                        );
                  }
                  return Center(child: Text("Error in loading"));
                },
              ),
            ),
          ),
          if (selectedIndex != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: SubmitButton(
                onPressed: () {
                  BlocProvider.of<SelectAddressBloc>(
                    context,
                  ).add(ChangeSelectAddressEvent(addressList[selectedIndex!]));
                  Navigator.of(context).pop();
                },
                text: 'Select Address',
              ),
            ),
        ],
      ),
    );
  }
}
