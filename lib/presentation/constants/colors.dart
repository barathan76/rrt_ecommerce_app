import 'package:flutter/material.dart';

final authTextFieldIconColor = Color.fromARGB(255, 98, 98, 98);
final authTextFieldHintColor = Color.fromARGB(255, 103, 103, 103);
final authTextFieldBorderColor = const Color.fromARGB(255, 168, 168, 169);
final Color kRedColor = const Color.fromARGB(255, 248, 55, 88);
final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 248, 55, 88),
  brightness: Brightness.light,
);

Color surfaceColor(BuildContext context) {
  return Theme.of(context).colorScheme.onPrimary;
}

Color kCardColor = Colors.white;
Color kContainerColor = Colors.white;
Color kDividerColor = Color.fromARGB(255, 187, 187, 187);
