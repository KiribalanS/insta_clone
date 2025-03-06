import 'package:flutter/material.dart';
import 'package:insta_clone/constants/fav_icon.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/post/send/screens/show_send.dart';
import 'package:insta_clone/profile/profile_screen.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.index, required this.focusNode});
  final FocusNode focusNode;
  final int index;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: MediaQuery.of(context).viewInsets.bottom > 0 ? .1 : 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      // color: Colors.black54,
                      backgroundColor: Colors.black54,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Hero(
                                tag: widget.index,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/person.jpg"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Text("User Name"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ),
                              );
                            },
                          ),
                          Text("Story song"),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox.expand(
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/person.jpg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 1,
              right: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 45,
                        child: Center(
                          child: TextField(
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            controller: controller,
                            focusNode: widget.focusNode,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              hintText: "Send a message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FavIcon(),
                  IconButton(
                    onPressed: () {
                      if (controller.text.trim() == "") {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              top: 30.0,
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: DraggableScrollableSheet(
                                expand: true,
                                initialChildSize:
                                    .7, // Half-screen initial height
                                minChildSize: .7,
                                maxChildSize: 1, // Full screen when scrolled

                                builder: (context, scrollController) {
                                  return ShowSend(
                                    controller: scrollController,
                                  );
                                }),
                          ),
                        );
                      } else {
                        controller.clear();
                        widget.focusNode.unfocus();
                      }
                    },
                    icon: Icon(
                      size: 31,
                      CustomIcons.paperPlane,
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
