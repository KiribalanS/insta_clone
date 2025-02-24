import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.content, required this.controller});
  final String content;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          controller.text += content;
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          foregroundColor: Colors.black,
          iconColor: Colors.black,
        ),
        iconAlignment: IconAlignment.start,
        icon: Icon(
          Icons.arrow_outward_outlined,
        ),
        label: Text(content),
      ),
    );
  }
}
