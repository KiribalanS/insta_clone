import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false, isSaved = false;
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
                    style: TextStyle(
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
        Image(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/post/post.jpeg"),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 25,
                width: 20,
                child: Image(image: AssetImage("assets/icons/chat.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 25,
                width: 20,
                child: Image(image: AssetImage("assets/icons/send.png")),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 25,
                width: 20,
                child: Image(
                  image: AssetImage("assets/icons/save-instagram.png"),
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
                    TextSpan(text: "Liked by "),
                    TextSpan(
                      text: "person_1 ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: "and "),
                    TextSpan(
                      text: "others ",
                      style: TextStyle(fontWeight: FontWeight.w600),
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
