import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/explore/screens/post_details.dart';
import 'package:insta_clone/explore/screens/search_screen.dart';
import 'package:insta_clone/widgets/bottom_navigation_bar.dart';
import 'package:insta_clone/post/post_widget.dart';
import 'package:insta_clone/widgets/search_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getData();
  }

  Future<void> getData() async {
    Future.delayed(
      Duration(seconds: 2),
    ).then(
      (value) => setState(() {
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    ),
                    child: Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Text(
                                "Search",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Skeletonizer(
                    effect: PulseEffect(
                      duration: Duration(milliseconds: 500),
                    ),
                    enabled: isLoading,
                    child: MasonryGridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetails(
                                  path: "assets/jpeg/${index % 10}.jpeg",
                                ),
                              ),
                            );
                          },
                          child: ImageTile(
                            height: 100,
                            width: 80,
                            index: index % 10,
                            path: "assets/jpeg/${index % 10}.jpeg",
                            // extent: (index % 5 + 1) * 100,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                CustomNavigationBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
