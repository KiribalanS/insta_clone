import 'package:flutter/material.dart';
import 'package:insta_clone/create_post/widgets/select_post.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool permissionAvailable = false;
  void checkPermission() async {
    var status = await Permission.mediaLibrary.status;

    if (status.isGranted) {
      setState(() {
        permissionAvailable = true;
      });
    } else {
      setState(() {
        permissionAvailable = false;
      });
    }
  }

  void checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        permissionAvailable = true;
      });
    } else {
      setState(() {
        permissionAvailable = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
    checkCameraPermission();
  }

  final List<String> options = [
    "Post",
    "Reel",
    "Story",
    "Live",
  ];
  int selectedIndex = 1;
  double dragOffset = 0.0;
  double itemWidth = 50.0;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.cancel_outlined,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Next",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (permissionAvailable)
            PageView(
              children: [
                SelectPost(),
              ],
            ),
          Positioned(
            bottom: 50,
            left: (mediaQuery.width / 2) - ((selectedIndex * itemWidth) + 50),
            child: Draggable(
              onDragEnd: (details) {
                if (details.offset.direction == 90) {
                  int newIndex = (-details.offset.distance / (itemWidth))
                      .round()
                      .clamp(0, options.length - 1);
                  dragOffset = details.offset.distance;
                  print(itemWidth);
                  print(details.offset.distance);
                  print(details.offset);
                  setState(() {
                    selectedIndex = newIndex;
                  });
                  dragOffset = 0;
                } else {
                  int newIndex = (details.offset.distance / (itemWidth))
                      .round()
                      .clamp(0, options.length - 1);
                  dragOffset = details.offset.distance;
                  print(itemWidth);
                  print(details.offset.distance);
                  print(details.offset);
                  setState(() {
                    selectedIndex = newIndex;
                  });
                  dragOffset = 0;
                }
              },
              feedback: SizedBox(),
              axis: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(15)),
                height: 40,
                width: 250,
                child: Center(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: index == selectedIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                        options[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!permissionAvailable)
            Center(
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Allow instagram to access your camera and microphone",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "This lets you share photos, record videos and preview effects. You can change this at anytime in your device settings.",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () async {
                      openAppSettings();
                    },
                    child: Text("Open settings"),
                  ),
                  SizedBox(height: 50)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
