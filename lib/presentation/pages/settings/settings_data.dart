import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/settings_tile.dart';

List<Widget> accountSettings(BuildContext context) => [
  SettingsTile(
    icon: Icons.person,
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => ProfilePage()));
    },
    text: 'Edit Profile',
  ),
  SettingsTile(
    icon: Icons.location_on,
    text: 'Saved Addresses',
    onPressed: () {},
  ),
  SettingsTile(icon: Icons.lock, text: 'Privacy', onPressed: () {}),
  SettingsTile(icon: Icons.credit_card, text: 'Saved cards', onPressed: () {}),
];

List<Widget> activityList = [
  SettingsTile(icon: Icons.rate_review, text: 'Reviews', onPressed: () {}),
  SettingsTile(
    icon: Icons.question_answer,
    text: 'Questions & Answers',
    onPressed: () {},
  ),
];
