import 'package:flutter/material.dart';

class CustomMenutile extends StatelessWidget {
  const CustomMenutile({super.key, required this.content, required this.icon});
  final String content;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(content),
      leading: Icon(icon),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
