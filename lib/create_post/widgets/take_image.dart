import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/create_post/widgets/show_image.dart';

class TakeImage extends StatefulWidget {
  const TakeImage({super.key, required this.controller, required this.onTap});
  final void Function() onTap;

  final CameraController controller;
  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isLoading = false;
  File? file;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {},
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .95,
            // width: MediaQuery.of(context).size.width * .7,
            child: file != null
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .85,
                      width: MediaQuery.of(context).size.width * .85,
                      color: Colors.amberAccent,
                      child: Image(
                        fit: BoxFit.cover,
                        image: FileImage(file!),
                      ),
                    ),
                  )
                : CameraPreview(
                    widget.controller,
                    child: Positioned(
                      bottom: 100,
                      left: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () async {
                          print("Request sent");
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            // Attempt to take a picture and then get the location
                            // where the image file is saved.
                            final image = await widget.controller.takePicture();
                            setState(() {
                              file = File(image.path);
                            });
                            print(await file!.exists());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DisplayImage(imagePath: image.path),
                              ),
                            );
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                            print("e\n\n\ne");
                          }

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
            bottom: 100,
            left: 10,
            child: IconButton(
              onPressed: () {
                widget.onTap();
              },
              icon: Icon(Icons.image),
            ),
          ),
          // if (file != null)

          if (isLoading)
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width * .85,
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
