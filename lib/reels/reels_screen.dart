import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:insta_clone/constants/fav_icon.dart';
import 'package:insta_clone/constants/navigate_profile.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/post/comment/show_commet.dart';
import 'package:insta_clone/post/send/screens/show_send.dart';
import 'package:insta_clone/reels/widgets/more_widget.dart';
import 'package:lottie/lottie.dart';
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
  bool toAnimate = false;
  @override
  void dispose() {
    _controller.dispose();
    likeAnimationController.dispose();
    super.dispose();
  }

  late AnimationController likeAnimationController =
      AnimationController(vsync: this);

  void showAnimation() {
    likeAnimationController.duration = Duration(seconds: 1);
    likeAnimationController.forward();
  }

  void likePost() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        toAnimate = true;
      }
    });
    showAnimation();
  }

  late final _gifcontroller = GifController(vsync: this);
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

    likeAnimationController.addListener(() {
      if (likeAnimationController.isCompleted) {
        setState(() {
          toAnimate = false;
        });
        likeAnimationController.reset();
      }
    });

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
                    onDoubleTap: likePost,
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
            if (toAnimate)
              Center(
                child: Lottie.asset(
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                  "assets/lottie/like_2.json",
                  repeat: false,
                  controller: likeAnimationController,
                ),
              ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Column(
                spacing: 10,
                children: [
                  FavIcon(
                    isLiked: isLiked,
                    onTap: likePost,
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        isScrollControlled: true,
                        isDismissible: true,
                        enableDrag: true,
                        // constraints: BoxConstraints.,
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: DraggableScrollableSheet(
                              expand: true,
                              initialChildSize:
                                  .5, // Half-screen initial height
                              minChildSize: .5,
                              maxChildSize: 1, // Full screen when scrolled
                              builder: (context, scrollController) {
                                return ShowCommet(
                                  controller: scrollController,
                                );
                              }),
                        ),
                      );
                    },
                    icon: Icon(
                      CustomIcons.comment,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        enableDrag: true,
                        isDismissible: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                            top: 30.0,
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: DraggableScrollableSheet(
                              expand: true,
                              initialChildSize:
                                  .7, // Half-screen initial height
                              minChildSize: .7,
                              maxChildSize: 1, // Full screen when scrolled

                              builder: (context, scrollController) {
                                return ShowSend(
                                  controller: scrollController,
                                );
                              }),
                        ),
                      );
                    },
                    icon: Icon(CustomIcons.paperPlane),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        // backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        isScrollControlled: true,
                        builder: (context) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: MoreOptionsWidget(),
                        ),
                      );
                    },
                    icon: Icon(Icons.more_horiz),
                  ),
                  // Icon(Icons.music_note),
                  Gif(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/gif/player.gif"),
                    controller:
                        _gifcontroller, // if duration and fps is null, original gif fps will be used.
                    //fps: 30,
                    //duration: const Duration(seconds: 3),
                    autostart: Autostart.loop,
                    placeholder: (context) => const Text('.'),
                    onFetchCompleted: () {
                      // _controller.forward();
                      // _controller.repeat();
                    },
                  ),
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
                          NavigateProfile(
                            child: ClipOval(
                              child: Image(
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/person.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NavigateProfile(child: Text("User Name")),
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
