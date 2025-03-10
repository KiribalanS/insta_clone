import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          hintText: content,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
