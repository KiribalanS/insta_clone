import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/search_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchWidget(),
            Center(
              child: Text("Explore"),
            ),
          ],
        ),
      ),
    );
  }
}
