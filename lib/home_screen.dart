import 'package:flutter/material.dart';
import 'package:insta_clone/direct_messages/screens/direct_message.dart';
import 'package:insta_clone/models/story_model.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';
import 'package:insta_clone/widgets/post_widget.dart';
import 'package:insta_clone/widgets/story_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DirectMessage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

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
              onTap: () => Navigator.push(
                context,
                _createRoute(),
              ),
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image(
                  image: AssetImage("assets/icons/send.png"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
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
              GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swiped from left to right (right swipe)
                    print("right -> left");
                  } else if (details.primaryVelocity! < 0) {
                    print('Swiped left to right');
                    if (mounted) {
                      Navigator.push(
                        context,
                        _createRoute(),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ChatScreen(),
                      //   ),
                      // );
                    }
                  }
                },
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => PostWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
