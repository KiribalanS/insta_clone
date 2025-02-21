import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: TextStyle(height: 3),
              alignLabelWithHint: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(3),
            ),
          ),
        ),
      ),
    );
  }
}
