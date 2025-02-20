import 'package:flutter/material.dart';
import 'package:insta_clone/direct_messages/widgets/custom_icon.dart';
import 'package:insta_clone/direct_messages/widgets/custom_tile.dart';
import 'package:insta_clone/direct_messages/widgets/shared_files_widget.dart';
import 'package:insta_clone/direct_messages/widgets/shared_posts.dart';

class ChatProfile extends StatefulWidget {
  const ChatProfile({super.key});

  @override
  State<ChatProfile> createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  final PageController pageViewController = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> list = [
    CustomTile(
      content: "Dis appearing messages",
      subtitle: "off",
      icon: Icons.timer_off_outlined,
    ),
    CustomTile(
      content: "Privacy and safety",
      icon: Icons.lock,
    ),
    CustomTile(
      content: "Nicknames",
      icon: Icons.person_pin_circle,
    ),
    CustomTile(
      content: "Create group chat",
      icon: Icons.group,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "userName",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIcon(
                          content: "Profile",
                          icon: Icons.person,
                        ),
                        CustomIcon(
                          content: "Search",
                          icon: Icons.search,
                        ),
                        CustomIcon(
                          content: "Mute",
                          icon: Icons.music_off_outlined,
                        ),
                        CustomIcon(
                          content: "Options",
                          icon: Icons.more_horiz,
                        ),
                      ],
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 35,
                          ),
                        ),
                      ),
                      title: Text("Theme"),
                      subtitle: Text("Star Wars: The acolyte"),
                      trailing: Card(
                        elevation: 0,
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "New",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                    ...list,
                  ],
                ),
              )
            ];
          },
          body: Column(
            children: [
              TabBar(
                dividerColor: Colors.black,
                indicatorColor: Colors.blue,
                indicatorWeight: 5,
                dividerHeight: 0,
                indicator: BoxDecoration(),
                unselectedLabelColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                controller: _controller,
                tabs: [
                  Icon(Icons.photo_size_select_large),
                  Icon(Icons.offline_share),
                  Icon(Icons.save),
                ],
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  SharedFilesWidget(),
                  SharedPosts(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.red),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
