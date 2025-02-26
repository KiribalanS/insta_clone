import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectPost extends StatefulWidget {
  const SelectPost({super.key});

  @override
  State<SelectPost> createState() => _SelectPostState();
}

class _SelectPostState extends State<SelectPost> {
  List<AssetEntity> mediaFiles = [];
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    _loadRecentMedia();
  }

  Future<void> _loadRecentMedia() async {
    final PermissionState permission =
        await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        onlyAll: true,
        type: RequestType.common, // Includes images & videos
      );

      if (albums.isNotEmpty) {
        List<AssetEntity> recentMedia =
            await albums[0].getAssetListPaged(page: 0, size: 50);
        setState(() {
          mediaFiles = recentMedia;
        });

        selectedFile = await mediaFiles[0].file;
        setState(() {});
      }
    } else {
      PhotoManager.openSetting();
    }
  }

  Future<Widget> _getThumbnail(AssetEntity entity) async {
    final thumbnail =
        await entity.thumbnailDataWithSize(ThumbnailSize(200, 200));

    return thumbnail != null
        ? InkWell(
            child: Image.memory(
              thumbnail,
              fit: BoxFit.cover,
            ),
            onTap: () async {
              selectedFile = await entity.file;
              setState(() {});
            },
          )
        : Container(color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .35,
          color: Colors.black,
          child: selectedFile != null ? Image.file(selectedFile!) : null,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: mediaFiles.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder<Widget>(
                      future: _getThumbnail(mediaFiles[index]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return snapshot.data!;
                        } else {
                          return Container(color: Colors.black12);
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }
}
