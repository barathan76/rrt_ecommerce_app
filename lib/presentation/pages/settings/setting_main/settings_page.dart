import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/setting_main/settings_container.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/setting_main/settings_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/auth_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/custom_bottom_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double gridHeight = ((width / 2) - (10)) * (4 / 2).ceil() * (1 / 5);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: mtextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 15,
            children: [
              SizedBox(
                height: gridHeight,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 6,
                  children: [...settingGridTileList(context)],
                ),
              ),
              SettingsContainer(
                list: accountSettings(context),
                title: 'Account Settings',
              ),
              SettingsContainer(list: activityList, title: 'My Activity'),
              AuthButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => LoginPage()));
                },
                text: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
