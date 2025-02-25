import 'package:flutter/material.dart';
import 'package:insta_clone/direct_messages/screens/direct_message.dart';
import 'package:insta_clone/home/screens/home_screen.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: RangeMaintainingScrollPhysics(),
      children: [
        HomeScreen(
          onTap: () {
            pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
        ),
        const DirectMessage(),
      ],
    );
  }
}
