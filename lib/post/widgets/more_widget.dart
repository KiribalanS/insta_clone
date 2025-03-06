import 'package:flutter/material.dart';
import 'package:insta_clone/constants/ui_contants.dart';
import 'package:insta_clone/post/widgets/option_icon.dart';

class MoreOptionsWidget extends StatefulWidget {
  const MoreOptionsWidget({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<MoreOptionsWidget> createState() => _MoreOptionsWidgetState();
}

class _MoreOptionsWidgetState extends State<MoreOptionsWidget> {
  final Map<IconData, String> tiles = {
    Icons.star: "Add to favourites",
    Icons.person_remove_sharp: "Unfollow",
    Icons.cut: "Create a cutout sticker",
    Icons.fullscreen: "Full screen",
    Icons.info: "Why you are seeing this",
    Icons.visibility_off: "Hide",
    Icons.person_pin_circle_sharp: "About this account",
  };

  @override
  Widget build(BuildContext context) {
    final data = tiles.entries.toList();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionIcon(child: Icon(size: 35, CustomIcons.turnedInNot)),
                OptionIcon(child: Icon(size: 35, Icons.add)),
                OptionIcon(
                    child: Icon(size: 35, Icons.import_contacts_outlined)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(CustomIcons.paperPlane),
            title: Text("We're moving things around"),
            subtitle: Text(
              "See where to share the posts",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.controller,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(data[index].key),
                  title: Text(data[index].value),
                );
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Colors.red,
            ),
            title: Text(
              "Report",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Manage content preferences"),
          )
        ],
      ),
    );
  }
}
