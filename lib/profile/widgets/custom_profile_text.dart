import 'package:flutter/widgets.dart';

class CustomProfileText extends StatelessWidget {
  const CustomProfileText(
      {super.key, required this.content1, required this.content2});
  final String content1;
  final String content2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(content1),
        Text(content2),
      ],
    );
  }
}
