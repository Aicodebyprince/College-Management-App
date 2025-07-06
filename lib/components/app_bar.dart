// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/loginpage.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showIcon;

  const MyAppBar({super.key, this.title, this.showIcon = true});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: const Color(0xFFD9D9D9),
      elevation: 0,
      title:
          title ??
          Image.asset(
            'assets/app_bar.png',
            height: 50,
            width: screenWidth * 0.8,
          ),
      leading: Builder(
        builder:
            (context) => IconButton(
              color: Colors.black,
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),
      actions: [
        if (showIcon)
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ); // Navigate to Announcements page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification icon pressed')),
              );
            },
          ),
      ],
    );
  }
}
