import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/my_orders/orders_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/coupons/coupons_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/help/help_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/privacy/privacy_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/q&a/q_and_a.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/reviews/reviews_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/saved_cards/saved_cards_page.dart';
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
  SettingsTile(
    icon: Icons.lock,
    text: 'Privacy',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => PrivacyPage()));
    },
  ),
  SettingsTile(
    icon: Icons.credit_card,
    text: 'Saved cards',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => SavedCardsPage()));
    },
  ),
];

List<Widget> activityList(BuildContext context) => [
  SettingsTile(
    icon: Icons.rate_review,
    text: 'Reviews',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => ReviewsPage()));
    },
  ),
  SettingsTile(
    icon: Icons.question_answer,
    text: 'Questions & Answers',
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => QAndA()));
    },
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
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => CouponsPage()));
    },
  ),
  SettingsGridTile(
    icon: Icons.help,
    text: 'Help',
    onPressed: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => HelpPage()));
    },
  ),
];
