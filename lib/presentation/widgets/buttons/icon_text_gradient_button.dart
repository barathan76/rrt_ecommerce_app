import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class IconTextGradientButton extends StatelessWidget {
  const IconTextGradientButton({
    super.key,
    required this.gradientColors,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final List<Color> gradientColors;
  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
      onTap: onPressed,
      child: SizedBox(
        width: 145,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(width: 100, height: 40),
                // Rectangular button
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                  ), // Leaves space for the circular icon
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientColors,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        text,
                        style: mtextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: gradientColors,
                      ),
                    ),
                    child: Icon(icon, size: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
