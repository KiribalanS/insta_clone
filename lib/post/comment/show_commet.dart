import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/post/comment/comment_widget.dart';
import 'package:insta_clone/post/comment/cubit/comments_cubit.dart';
import 'package:insta_clone/profile/screens/profile_screen.dart';

class ShowCommet extends StatefulWidget {
  const ShowCommet({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<ShowCommet> createState() => _ShowCommetState();
}

class _ShowCommetState extends State<ShowCommet> {
  @override
  Widget build(BuildContext context) {
    List<String> comments = context.watch<CommentsCubit>().state;
    return SafeArea(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 20,
              child: Divider(
                height: 3,
                thickness: 3,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Text("Comments",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            if (comments.isEmpty)
              Center(
                child: Text("No comments yet"),
              ),
            if (comments.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  controller: widget.controller,
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) => CommentWidget(
                    comment: comments[index],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  border: InputBorder.none,
                  hintText: "Add a comment for user",
                  hintStyle: TextStyle(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: InkWell(
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
      ),
    );
  }
}
