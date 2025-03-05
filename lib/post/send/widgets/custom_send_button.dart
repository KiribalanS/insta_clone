import 'package:flutter/material.dart';

class CustomSendButton extends StatelessWidget {
  const CustomSendButton({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 49,
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 11, 101, 174),
          ),
          child: Center(
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
