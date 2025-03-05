import 'package:flutter/material.dart';
import 'package:insta_clone/home/widgets/story_page_view.dart';
import 'package:insta_clone/models/story_model.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key, required this.index, required this.story});
  final int index;
  final StoryModel story;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryPageView(
              startPage: index,
            ),
          ),
        );
      },
      child: Column(
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
                          child: Hero(
                            tag: index,
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
              ),
              if (index == 0)
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Center(
            child: Text(
              index > 0 ? "${story.name} $index" : story.name,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
