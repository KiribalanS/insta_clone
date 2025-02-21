import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/profile/widgets.dart/custom_menutile.dart';
import 'package:insta_clone/widgets/search_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Map<String, IconData> mapForYourInstagram = {
    "Saved": Icons.save,
    "Archive": Icons.archive,
    "Your Activity": Icons.local_activity,
    "Notifications": Icons.notification_important,
    "Time Management": Icons.timelapse,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings and activity"),
        ),
        body: Column(
          children: [
            SearchWidget(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("your account"),
                  Text("Meta"),
                ],
              ),
            ),
            Text("How you use instagram"),
            for (MapEntry<String, IconData> e in mapForYourInstagram.entries)
              CustomMenutile(content: e.key, icon: e.value),
          ],
        ));
  }
}
