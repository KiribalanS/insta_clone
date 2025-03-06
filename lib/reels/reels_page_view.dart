import 'package:flutter/material.dart';
import 'package:insta_clone/reels/reels_screen.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';

class ReelsPageView extends StatefulWidget {
  const ReelsPageView({super.key});

  @override
  State<ReelsPageView> createState() => _ReelsPageViewState();
}

class _ReelsPageViewState extends State<ReelsPageView> {
  List<String> urls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/animation/curve_bounce_out.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/animation/curve_ease.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Text("Reels"),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        // itemCount: videoUrls.length, // or a very large number for infinite effect.
        itemBuilder: (context, index) {
          return ReelsScreen(
            videoUrl: urls[index ~/ (urls.length - 1)],
          ); // Loops videos.
        },
        onPageChanged: (value) {},
      ),
      bottomNavigationBar: CustomNavigationBar(
        action: () {
          // _controller.pause();
        },
      ),
    );
  }
}
