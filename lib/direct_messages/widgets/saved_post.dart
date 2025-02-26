import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';

class SavedPosts extends StatelessWidget {
  const SavedPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.all(1),
          color: Colors.blueAccent,
          child: Center(
            child: ImageTile(
              height: 100,
              width: 80,
              index: index % 10,
              path: "assets/png/${index % 3}.png",
              // extent: (index % 5 + 1) * 100,
            ),
          ),
        ),
      ),
    );
  }
}
