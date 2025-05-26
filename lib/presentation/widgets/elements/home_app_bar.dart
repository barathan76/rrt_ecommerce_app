import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading: IconButton(
      //   hoverColor: Color.fromARGB(255, 242, 242, 242),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   icon: Icon(
      //     Icons.menu_rounded,
      //     color: Color.fromARGB(255, 50, 50, 50), // Icon color
      //   ),
      // ),
      title: Text(
        'Trendz',
        style: GoogleFonts.libreCaslonText(
          color: Color.fromARGB(255, 67, 146, 249),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
