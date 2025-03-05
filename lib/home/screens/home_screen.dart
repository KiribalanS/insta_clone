import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/models/story_model.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';
import 'package:insta_clone/post/post_widget.dart';
import 'package:insta_clone/home/widgets/story_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: SizedBox(),
        leadingWidth: 0,
        title: Image(
          height: 50,
          image: AssetImage("assets/images/logo_no_bg.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              size: 28,
              Icons.favorite_border,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  CustomIcons.paperPlane,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 110,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dummyStories.length,
                itemBuilder: (context, index) {
                  return StoryWidget(
                    index: index,
                    story: dummyStories[index],
                  );
                },
              ),
            ),
            Divider(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => PostWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
