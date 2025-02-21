import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomMenutile extends StatelessWidget {
  const CustomMenutile({super.key, required this.content, required this.icon});
  final String content;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(content),
      leading: Icon(icon),
    );
  }
}
