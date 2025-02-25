import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/create_post/screens/create_post.dart';
import 'package:insta_clone/explore/screens/explore_screen.dart';
import 'package:insta_clone/home/screens/home.dart';
import 'package:insta_clone/profile/profile_screen.dart';
import 'package:insta_clone/reels/reels_page_view.dart';
import 'package:insta_clone/reels/reels_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, this.action});
  final void Function()? action;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (value) {
        if (action != null) {
          action!();
        }
      },
      backgroundColor: Colors.white,
      destinations: [
        IconButton(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
            weight: 4.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageView(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
            weight: 4.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExploreScreen(),
              ),
            );
          },
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePost(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              CustomIcons.library_add,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReelsPageView(),
              ),
            );
          },
          child: SizedBox(
            height: 25,
            width: 20,
            child: Image(
              color: Colors.black,
              image: AssetImage("assets/icons/reel.png"),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/person.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
