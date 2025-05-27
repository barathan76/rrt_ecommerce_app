import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

AlertDialog orderConfirmationDialog = AlertDialog(
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.check_circle,
        color: kRedColor,
        size: 100, // Large icon size
      ),
      SizedBox(height: 20),
      Text(
        'Order Confirmed!',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  ),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);
