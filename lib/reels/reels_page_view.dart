import 'package:flutter/material.dart';
import 'package:insta_clone/reels/reels_screen.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';
import 'package:video_player/video_player.dart';

class ReelsPageView extends StatefulWidget {
  const ReelsPageView({super.key});

  @override
  State<ReelsPageView> createState() => _ReelsPageViewState();
}

class _ReelsPageViewState extends State<ReelsPageView> {
  late VideoPlayerController _controller;

  List<String> urls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
