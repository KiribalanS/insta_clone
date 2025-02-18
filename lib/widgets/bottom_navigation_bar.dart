import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white,
      destinations: [
        IconButton(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
            weight: 4.0,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
            weight: 4.0,
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 25,
          width: 20,
          child: Image(image: AssetImage("assets/icons/more.png")),
        ),
        SizedBox(
          height: 25,
          width: 20,
          child: Image(image: AssetImage("assets/icons/reel.png")),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.hardEdge,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/person.jpg"),
          ),
        ),
      ],
    );
  }
}
