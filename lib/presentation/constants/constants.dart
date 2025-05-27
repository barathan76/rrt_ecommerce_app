import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final authTextFieldIconColor = Color.fromARGB(255, 98, 98, 98);
final authTextFieldHintColor = Color.fromARGB(255, 103, 103, 103);
final authTextFieldBorderColor = const Color.fromARGB(255, 168, 168, 169);

Color surfaceColor(BuildContext context) {
  return Theme.of(context).colorScheme.onPrimary;
}

final Color kRedColor = const Color.fromARGB(255, 248, 55, 88);

TextStyle mtextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.montserrat(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 248, 55, 88),
  brightness: Brightness.light,
);

final greyBoxShadow = BoxShadow(
  blurStyle: BlurStyle.outer,
  blurRadius: 1,
  spreadRadius: 1,
  color: Color.fromARGB(255, 202, 202, 202),
);

RichText authHeaderText({String? text1, String? text2}) => RichText(
  text: TextSpan(
    style: mtextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    children: [TextSpan(text: '$text1 \n'), TextSpan(text: text2)],
  ),
);

Color kCardColor = Colors.white;
Color kContainerColor = Colors.white;
Color kDividerColor = Color.fromARGB(255, 187, 187, 187);

Container kOutlineContainer({
  double? width,
  Widget? child,
  double? height,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
}) => Container(
  width: width,
  height: height,
  padding: padding,
  margin: margin,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: kContainerColor,
    boxShadow: [greyBoxShadow],
  ),
  child: child,
);

Container kOutlineNSContainer({
  double? width,
  Widget? child,
  double? height,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
}) => Container(
  width: width,
  height: height,
  padding: padding,
  margin: margin,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: kContainerColor,
  ),
  child: child,
);
