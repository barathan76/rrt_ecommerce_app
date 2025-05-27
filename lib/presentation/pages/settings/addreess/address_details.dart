import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/address.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({
    super.key,
    this.title = 'Add delivery address',
    this.address,
    required this.onSubmit,
  });
  final String title;
  final Address? address;
  final void Function(Address) onSubmit;

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
      numberController.text = '${widget.address!.number}';
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
        Address(
          name: nameController.text,
          number: int.parse(numberController.text),
          pincode: int.parse(pincodeController.text),
          state: stateController.text,
          city: cityController.text,
          addressLine1: address1Controller.text,
          addressLine2: address2Controller.text,
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

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.title,
    this.hintText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String title;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _showError) {
        setState(() {
          _showError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUnfocus,
      focusNode: _focusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            _showError = true;
          });
        }
        return null;
      },
      keyboardType: widget.keyboardType ?? TextInputType.text,
      style: mtextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        label: Text(
          widget.title,
          style: mtextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        prefixIcon:
            widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: authTextFieldIconColor)
                : null,
        suffixIcon:
            widget.suffixIcon != null
                ? Icon(widget.suffixIcon, color: authTextFieldIconColor)
                : null,
        hintText: widget.hintText,
        hintStyle: mtextStyle(
          color: authTextFieldHintColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: authTextFieldBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: _showError ? 'Please provide the necessary details' : null,
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.selectedType,
    required this.buttonType,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final AddressType selectedType;
  final AddressType buttonType;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    bool condition = selectedType == buttonType;
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: condition ? Colors.green : Colors.black),
      label: Text(
        title,
        style: TextStyle(color: condition ? Colors.green : Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: condition ? Colors.green : Colors.grey,
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
