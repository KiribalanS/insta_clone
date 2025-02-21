import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/models/story_model.dart';

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({super.key, required this.story});
  final StoryModel story;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.pink,
                        Colors.yellow,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/person.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            story.name,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
