import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/auth/screens/login.dart';
import 'package:insta_clone/auth/screens/signup.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/profile/widgets/custom_menutile.dart';
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
  final Map<String, IconData> moreInfo = {
    "Help": Icons.add_circle_outline,
    "Privacy": Icons.safety_check,
    "Account status": Icons.person_2_outlined,
    "About": Icons.help_center_outlined,
  };
  final Map<String, IconData> whoCanSeeYourContent = {
    "Account privacy": Icons.private_connectivity,
    "Close friends": Icons.star_outline_sharp,
    "Cross posting": Icons.extension,
    "Blocked": Icons.block,
    "Hide story and live": Icons.app_blocking,
  };
  final Map<String, IconData> howOthersCanInteractWithYou = {
    "Messages and story replies": Icons.message,
    "Tags and mentions": Icons.tag_sharp,
    "Comments": Icons.comment_bank,
    "Sharing": Icons.share_rounded,
    "Restricted": Icons.person_add_disabled_outlined,
    "Limit interactions": Icons.comments_disabled,
    "Hidden words": Icons.sort_by_alpha,
    "Follow and invite friends": Icons.person_add,
  };

  final Map<String, IconData> whatYouSee = {
    "Favourites": Icons.star,
    "Mute": Icons.do_disturb,
    "Content preference": Icons.video_collection_rounded,
    "Like and share count": Icons.disabled_by_default,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings and activity"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "your account",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Meta",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            divider,
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "How you use instagram",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            for (MapEntry<String, IconData> e in mapForYourInstagram.entries)
              CustomMenutile(content: e.key, icon: e.value),
            divider,
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "More info and support",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            for (MapEntry<String, IconData> e in moreInfo.entries)
              CustomMenutile(content: e.key, icon: e.value),
            divider,
            for (MapEntry<String, IconData> e in whoCanSeeYourContent.entries)
              CustomMenutile(content: e.key, icon: e.value),
            divider,
            for (MapEntry<String, IconData> e
                in howOthersCanInteractWithYou.entries)
              CustomMenutile(content: e.key, icon: e.value),
            divider,
            for (MapEntry<String, IconData> e in whatYouSee.entries)
              CustomMenutile(content: e.key, icon: e.value),
            divider,
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              ),
              child: Text(
                "Add account",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
              child: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
              child: Text(
                "Log out of all accounts",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
