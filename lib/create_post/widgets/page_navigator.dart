import 'package:flutter/material.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({
    super.key,
    required this.optionsPageViewController,
    required this.selectedIndex,
    required this.onPageChange,
  });
  final PageController optionsPageViewController;
  final int selectedIndex;
  final void Function(int ind) onPageChange;
  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  final List<String> options = [
    "Post",
    "Reel",
    "Story",
    "Live",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: PageView.builder(
        // padEnds: false,
        controller: widget.optionsPageViewController,
        itemCount: options.length,

        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onPageChange(index);
        },
        itemBuilder: (context, index) {
          double scale = index == selectedIndex ? 1.3 : 1.0;

          return Transform.scale(
            scale: scale,
            child: InkWell(
              onTap: () {
                // widget.onPageChange(index);
                widget.optionsPageViewController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 54, 54),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(index == 0 ? 25 : 0),
                    topLeft: Radius.circular(index == 0 ? 25 : 0),
                    bottomRight: Radius.circular(index == 3 ? 25 : 0),
                    topRight: Radius.circular(index == 3 ? 25 : 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    options[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: index == selectedIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
