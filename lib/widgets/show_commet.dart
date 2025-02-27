import 'package:flutter/material.dart';
import 'package:insta_clone/profile/profile_screen.dart';

class ShowCommet extends StatefulWidget {
  const ShowCommet({super.key});

  @override
  State<ShowCommet> createState() => _ShowCommetState();
}

class _ShowCommetState extends State<ShowCommet> {
  @override
  void initState() {
// final focusNode =    FocusNode();
// focusNode.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "Comments",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Center(
            child: Text("No comments yet"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "  Add a comment for user",
                hintStyle: TextStyle(),
                prefixIcon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 37,
                    width: 37,
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
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                    size: 40,
                    Icons.sticky_note_2_sharp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
