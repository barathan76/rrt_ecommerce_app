import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

TextStyle mtextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.montserrat(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

final numberRegex = RegExp(r'^[0-9]+$');

final greyBoxShadow = BoxShadow(
  blurStyle: BlurStyle.outer,
  blurRadius: 1,
  spreadRadius: 1,
  color: Color.fromARGB(255, 202, 202, 202),
);

Divider divide() {
  return Divider(thickness: 1, color: Color.fromARGB(255, 196, 196, 196));
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: mtextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}

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
