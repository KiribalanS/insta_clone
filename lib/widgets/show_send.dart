import 'package:flutter/material.dart';

class ShowSend extends StatelessWidget {
  const ShowSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Card(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.person_add),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    radius: 15,
                  );
                },
              ),
            ),
            Card(
              child: ListView.builder(
                itemBuilder: (context, index) => CircleAvatar(
                  radius: 15,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
