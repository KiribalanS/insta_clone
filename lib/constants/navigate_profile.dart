import 'package:flutter/material.dart';
import 'package:insta_clone/profile/profile_screen.dart';

class NavigateProfile extends StatelessWidget {
  const NavigateProfile({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      },
      child: child,
    );
  }
}
