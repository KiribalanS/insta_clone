import 'package:flutter/material.dart';
import 'package:insta_clone/direct_messages/widgets/shared_files_widget.dart';
import 'package:insta_clone/home/widgets/story_page_view.dart';
import 'package:insta_clone/models/story_model.dart';
import 'package:insta_clone/profile/screens/menu.dart';
import 'package:insta_clone/profile/widgets/custom_profile_text.dart';
import 'package:insta_clone/profile/widgets/highlight_widget.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.isSelfProfile = false});
  final bool isSelfProfile;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MenuScreen(),
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
        title: Text(
          "userName",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          //threads
          // IconButton(
          //   onPressed: null,
          //   icon: Icon(
          //     Icons.comp,
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.post_add,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, _createRoute());
            },
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 10, right: 10),
                        child: ClipOval(
                          child: Image(
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/person.jpg"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "userName  he/him",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomProfileText(
                                      content1: "0", content2: "Posts"),
                                  CustomProfileText(
                                      content1: "100", content2: "followers"),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: CustomProfileText(
                                        content1: "100", content2: "following"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 15),
                  child: Text(
                    "Bio",
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .40,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            widget.isSelfProfile ? "Edit profile" : "Follow",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .40,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            widget.isSelfProfile ? "Share profile" : "Message",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            size: 30,
                            Icons.person_add_alt_1_outlined,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    "Highlights",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyStories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoryPageView(
                                    startPage: index,
                                  ),
                                ));
                          },
                          child: HighlightWidget(
                            story: dummyStories[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            TabBar(
              dividerHeight: 0,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              labelColor: Theme.of(context).colorScheme.onPrimary,
              controller: tabController,
              tabs: [
                Tab(child: Icon(Icons.grid_4x4_outlined)),
                Tab(child: Icon(Icons.perm_media_rounded)),
                Tab(child: Icon(Icons.person_pin)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SharedFilesWidget(),
                  SharedFilesWidget(),
                  SharedFilesWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
