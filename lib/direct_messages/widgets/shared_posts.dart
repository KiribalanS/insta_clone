import 'package:flutter/material.dart';

class SharedPosts extends StatelessWidget {
  const SharedPosts({super.key});

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
      itemCount: 15,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.blueAccent,
          child: Center(
            child: Text("Posts ${index + 1}"),
          ),
        ),
      ),
    );
  }
}
