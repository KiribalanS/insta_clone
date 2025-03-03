import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/create_post/screens/create_post.dart';
import 'package:insta_clone/direct_messages/screens/direct_message.dart';
import 'package:insta_clone/home/screens/home_screen.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: RangeMaintainingScrollPhysics(),
      children: [
        CreatePost(
          onTap: (context) {
            pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
          shouldPop: false,
        ),
        HomeScreen(
          onTap: () {
            pageController.animateToPage(
              2,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
        ),
        DirectMessage(
          onTap: () {
            pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
        ),
      ],
    );
  }
}
