import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/box_shadow.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key, required this.list, required this.title});
  final List<Widget> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [normalBoxShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: mtextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          ...list,
        ],
      ),
    );
  }
}
