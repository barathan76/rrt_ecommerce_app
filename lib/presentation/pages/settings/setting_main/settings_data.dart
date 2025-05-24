import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/orders_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/setting_main/setting_grid_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/setting_main/settings_tile.dart';
import 'package:rrt_ecommerce_app/presentation/pages/wishlist/wishlist_page.dart';

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
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => AddressPage()));
    },
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

List<Widget> settingGridTileList(BuildContext context) => [
  SettingsGridTile(
    icon: Icons.inventory,
    text: 'Orders',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => OrdersPage()));
    },
  ),
  SettingsGridTile(
    icon: Icons.favorite,
    text: 'Wishlist',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => WishlistPage()));
    },
  ),
  SettingsGridTile(
    icon: Icons.card_giftcard,
    text: 'Coupons',
    onPressed: () {},
  ),
  SettingsGridTile(icon: Icons.help, text: 'Help', onPressed: () {}),
];
