import 'package:flutter/material.dart';

final divider = Divider(
  thickness: 2,
  endIndent: 10,
  indent: 10,
);

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? Colors.white,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.path,
  });

  final String path;

  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // 'https://picsum.photos/$width/$height?random=$index',
      path,
      width: width.toDouble(),
      // height: height.toDouble(),
      fit: BoxFit.cover,
    );
  }
}

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData play =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData commentAlt =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData paperPlane =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData comment =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData video =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData libraryAdd =
      IconData(0xe9ca, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData turnedIn =
      IconData(0xeb60, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData turnedInNot =
      IconData(0xeb61, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
