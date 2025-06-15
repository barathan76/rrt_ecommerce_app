import 'package:flutter/material.dart';

SnackBar customSnackBar({String? content}) {
  return SnackBar(
    content: Text(content ?? ''),
    duration: Duration(milliseconds: 10),
  );
}

void clearSnackBars(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
}

void showSnackBar(BuildContext context, {String? content}) {
  clearSnackBars(context);
  ScaffoldMessenger.of(context).showSnackBar(customSnackBar(content: content));
}
