import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key, required this.content, this.subtitle, required this.icon});
  final String content;
  final String? subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 35,
      ),
      title: Text(content),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
