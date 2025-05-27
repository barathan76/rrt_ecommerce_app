import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key, required this.list, required this.title});
  final List<Widget> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return kOutlineContainer(
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
