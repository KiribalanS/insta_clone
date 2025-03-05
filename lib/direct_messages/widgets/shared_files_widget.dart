import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/explore/screens/post_details.dart';

class SharedFilesWidget extends StatelessWidget {
  const SharedFilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: 40,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetails(
                  path: "assets/jpeg/${index % 10}.jpeg",
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(1),
            color: Colors.orange,
            child: ImageTile(
              height: 100,
              width: 80,
              index: index % 10,
              path: "assets/jpeg/${index % 10}.jpeg",
              // extent: (index % 5 + 1) * 100,
            ),
          ),
        ),
      ),
    );
  }
}
