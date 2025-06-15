import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/custom_text_form_field.dart';
import 'package:rrt_ecommerce_app/services/validators.dart';
import 'package:user_repository/user_repository.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({
    super.key,
    this.title = 'Add delivery address',
    this.address,
    required this.onSubmit,
  });
  final String title;
  final UserAddress? address;
  final void Function(UserAddress) onSubmit;

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  AddressType selectedAddressType = AddressType.empty;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.address != null) {
      nameController.text = widget.address!.name;
      numberController.text = widget.address!.number;
      stateController.text = widget.address!.state;
      cityController.text = widget.address!.city;
      pincodeController.text = '${widget.address!.pincode}';
      address1Controller.text = widget.address!.addressLine1;
      address2Controller.text = widget.address!.addressLine2;
      selectedAddressType = widget.address!.addressType;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    stateController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        UserAddress(
          name: nameController.text,
          number: numberController.text,
          pincode: int.parse(pincodeController.text),
          state: stateController.text,
          city: cityController.text,
          addressLine1: address1Controller.text,
          addressLine2: address2Controller.text,
          addressType: selectedAddressType,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: mtextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kRedColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CustomTextFormField(
                  controller: nameController,

                  title: 'Full Name',
                ),
                CustomTextFormField(
                  controller: numberController,

                  title: 'Phone number',
                  keyboardType: TextInputType.number,
                  regExp: numberRegex,
                ),
                CustomTextFormField(
                  controller: stateController,

                  title: 'State',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: cityController,

                        title: 'City',
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: pincodeController,
                        regExp: numberRegex,
                        title: 'Pincode',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: address1Controller,

                  title: 'House No, Building Name',
                  keyboardType: TextInputType.streetAddress,
                ),
                CustomTextFormField(
                  controller: address2Controller,

                  title: 'Road name, Area',
                  keyboardType: TextInputType.streetAddress,
                ),
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type of Address'),
                    Row(
                      spacing: 10,
                      children: [
                        CustomIconButton(
                          selectedType: selectedAddressType,
                          title: 'Home',
                          icon: Icons.home,
                          buttonType: AddressType.home,
                          onPressed: () {
                            setState(() {
                              selectedAddressType = AddressType.home;
                            });
                          },
                        ),
                        CustomIconButton(
                          selectedType: selectedAddressType,
                          title: 'Work',
                          icon: Icons.work,
                          buttonType: AddressType.work,
                          onPressed: () {
                            setState(() {
                              selectedAddressType = AddressType.work;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    SubmitButton(
                      onPressed: () {
                        onSubmit();
                      },
                      text: 'Save Address',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
