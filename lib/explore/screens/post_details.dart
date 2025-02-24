import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/post_widget.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PostWidget(
          path: path,
        ),
      ),
    );
  }
}
