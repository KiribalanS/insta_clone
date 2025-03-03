import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool isLoading = true;
  bool isFollowed = false;
  bool isLiked = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    _controller.initialize().then(
      (value) {
        setState(() {
          isLoading = false;
        });
      },
    );
    _controller.setLooping(true);
    _controller.play();

    // _controller.addListener(
    //   () {
    //     if (_controller.value.isInitialized) {
    //       setState(() {
    //         AnimationController(
    //           vsync: this,
    //           duration: _controller.value.position,
    //         )
    //             // ..addListener(() {
    //             //   setState(() {});
    //             // })
    //             .repeat(reverse: true);
    //         progressIndicator = playbackController;
    //       });
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        _controller.dispose();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onLongPress: () {},
                    onLongPressStart: (details) {
                      setState(() {
                        _controller.pause();
                      });
                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        _controller.play();
                      });
                    },
                    child: Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                  ),
                ),

                VideoProgressIndicator(_controller, allowScrubbing: true),

                // if (_controller.value.isInitialized)
                //   LinearProgressIndicator(value: progressIndicator)
              ],
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Column(
                spacing: 25,
                children: [
                  Icon(Icons.favorite_border),
                  Icon(CustomIcons.comment),
                  Icon(CustomIcons.paperPlane),
                  Icon(Icons.more_horiz),
                  Icon(Icons.music_note),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Skeletonizer(
                enabled: isLoading,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image(
                              height: 55,
                              width: 55,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/person.jpg"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User Name"),
                                TextScroll("song details"),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: Text("Follow"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .75,
                        child: ReadMoreText(
                          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                          trimMode: TrimMode.Line,
                          trimLines: 1,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: '...',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
