import 'package:flutter/material.dart';
import 'package:insta_clone/explore/widgets/custom_elevated_button.dart';
import 'package:insta_clone/widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: SearchWidget(
                    controller: controller,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomElevatedButton(
                    content: "Suggestions",
                    controller: controller,
                  ),
                  CustomElevatedButton(
                    content: "Suggestions",
                    controller: controller,
                  ),
                  CustomElevatedButton(
                    content: "Suggestions",
                    controller: controller,
                  ),
                  CustomElevatedButton(
                    content: "Suggestions",
                    controller: controller,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
