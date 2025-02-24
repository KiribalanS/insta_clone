import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, this.path});
  final String? path;

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
        Center(
          child: Image(
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            image: AssetImage(widget.path ?? "assets/post/post.jpeg"),
          ),
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
