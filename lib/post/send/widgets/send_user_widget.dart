import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/post/send/cubit/send_count_cubit.dart';

class SendUserWidget extends StatefulWidget {
  const SendUserWidget({super.key});

  @override
  State<SendUserWidget> createState() => _SendUserWidgetState();
}

class _SendUserWidgetState extends State<SendUserWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        context.read<SendCountCubit>().handleSelection(isSelected);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 35,
                  backgroundColor: Colors.blue,
                  child: Padding(
                    padding: isSelected ? EdgeInsets.all(4) : EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/person.jpg"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "UserName",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              bottom: 43,
              right: 33,
              child: Icon(
                Icons.verified,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
