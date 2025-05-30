import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.title,
    this.hintText,
    this.keyboardType,
    this.regExp,
  });

  final TextEditingController controller;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String title;
  final String? hintText;
  final TextInputType? keyboardType;
  final RegExp? regExp;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;
  bool _showRegExp = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _showError) {
        setState(() {
          _showError = false;
        });
      } else if (_focusNode.hasFocus && _showRegExp) {
        setState(() {
          _showRegExp = false;
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
        } else if (widget.regExp != null && !widget.regExp!.hasMatch(value)) {
          setState(() {
            _showRegExp = true;
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
        errorText:
            _showError
                ? 'Please provide the necessary details'
                : _showRegExp
                ? 'Enter valid input'
                : null,
      ),
    );
  }
}
