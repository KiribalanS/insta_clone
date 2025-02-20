import 'package:flutter/material.dart';

class SharedFilesWidget extends StatelessWidget {
  const SharedFilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 15,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.orange,
            child: Center(
              child: Text("file ${index + 1}"),
            ),
          ),
        ),
      ),
    );
  }
}
