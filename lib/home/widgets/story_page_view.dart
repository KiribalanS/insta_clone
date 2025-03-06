import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:insta_clone/home/widgets/story_page.dart';

class StoryPageView extends StatefulWidget {
  const StoryPageView({super.key, required this.startPage});
  final int startPage;

  @override
  State<StoryPageView> createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  late final CarouselSliderController controller;
  @override
  void initState() {
    controller = CarouselSliderController();
    super.initState();
  }

  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      controller: controller,
      initialPage: widget.startPage,
      scrollPhysics: NeverScrollableScrollPhysics(),
      slideTransform: CubeTransform(),
      slideBuilder: (int index) {
        return GestureDetector(
          child: StoryPage(
            index: index,
            focusNode: focusNode,
          ),
          // onLongPressStart: (details) {
          //   setState(() {
          //     // _controller.pause();
          //   });
          // },
          // onLongPressEnd: (details) {
          //   setState(() {
          //     // _controller.play();
          //   });
          // },
          onTapDown: (details) {
            print(details.localPosition);
            print(details.globalPosition);
            if (details.localPosition.dx < 170) {
              controller.previousPage(Duration(milliseconds: 750));
            }

            if (details.localPosition.dx > 230) {
              controller.nextPage(Duration(milliseconds: 750));
            }
          },
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              if (index > 0) {
                controller.previousPage(Duration(milliseconds: 750));
              }
            } else if (details.delta.dx < 0) {
              if (index < 15) {
                controller.nextPage(Duration(milliseconds: 750));
              } else {
                Navigator.pop(context);
              }
            } else if (details.delta.dy > 0) {
              Navigator.pop(context);
            } else {
              focusNode.requestFocus();
            }

            // if (details.delta.dy < 0) {
            //   // Swiping Up
            //   print("Swiped Up");
            // } else if (details.delta.dy > 0) {
            //   // Swiping Down
            //   print("Swiped Down");
            // }
          },
        );
      },
      itemCount: 15,
    );
  }
}
