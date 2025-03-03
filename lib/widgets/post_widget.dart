import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/comment/show_commet.dart';
import 'package:insta_clone/send/screens/show_send.dart';
import 'package:lottie/lottie.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, this.path});
  final String? path;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with TickerProviderStateMixin {
  bool isLiked = false, isSaved = false, toAnimate = false;
  late AnimationController likeAnimationController =
      AnimationController(vsync: this);

  @override
  void dispose() {
    super.dispose();
    likeAnimationController.dispose();
  }

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

  @override
  void initState() {
    likeAnimationController.addListener(() {
      if (likeAnimationController.isCompleted) {
        setState(() {
          toAnimate = false;
        });
        likeAnimationController.reset();
      }
    });
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 50,
                  width: 50,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/person.jpg"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "User Name",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
              Icon(Icons.more_horiz),
            ],
          ),
        ),
        Stack(
          children: [
            GestureDetector(
              onDoubleTap: likePost,
              child: Center(
                child: Image(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  image: AssetImage(widget.path ?? "assets/post/post.jpeg"),
                ),
              ),
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
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: likePost,
              icon: Icon(
                  size: 30, isLiked ? Icons.favorite : Icons.favorite_border),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
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
                          initialChildSize: .5, // Half-screen initial height
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
                  size: 27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
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
                          initialChildSize: .7, // Half-screen initial height
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
                icon: Icon(
                  CustomIcons.paperPlane,
                  size: 27,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
                icon: Icon(
                  isSaved ? CustomIcons.turnedIn : CustomIcons.turnedInNot,
                  size: 33,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Liked by ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: "person_1 ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: "and "),
                    TextSpan(
                      text: "others ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            "February 20",
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
