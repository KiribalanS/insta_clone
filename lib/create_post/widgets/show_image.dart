// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;

  const DisplayImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
