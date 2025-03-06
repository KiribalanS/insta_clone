import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, this.isLiked = false, this.onTap});
  final bool isLiked;
  final void Function()? onTap;
  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isLiked = false;
  @override
  void initState() {
    isLiked = widget.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      icon: Icon(
        size: 35,
        color: isLiked ? Colors.pink : Colors.black,
        isLiked ? Icons.favorite : Icons.favorite_border,
      ),
    );
  }
}
