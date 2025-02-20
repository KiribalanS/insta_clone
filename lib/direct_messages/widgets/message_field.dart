import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/direct_messages/cubit/message_cubit.dart';
import 'package:insta_clone/models/message_model.dart';

class MessageField extends StatefulWidget {
  const MessageField(
      {super.key, required this.messageController, required this.scrollDown});
  final TextEditingController messageController;
  final Function() scrollDown;

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final Widget trailing = Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
        onPressed: null,
        icon: Icon(
          Icons.mic,
        ),
      ),
      IconButton(
        onPressed: null,
        icon: Icon(
          Icons.image,
        ),
      ),
      IconButton(
        onPressed: null,
        icon: Icon(
          Icons.sticky_note_2,
        ),
      ),
    ],
  );

  void addMessage(String msg) {
    context.read<MessageCubit>().addMessage(
          MessageModel(message: msg, isMe: true),
        );
  }

  bool textFieldTrailing = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          maxLines: null,
          enabled: true,
          controller: widget.messageController,
          onTap: widget.scrollDown,
          onChanged: (value) {
            print(value);
            if (value == "") {
              setState(() {
                textFieldTrailing = true;
              });
            } else {
              setState(() {
                textFieldTrailing = false;
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 12.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                maxRadius: 12,
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 27,
                  ),
                ),
              ),
            ),
            suffixIcon: textFieldTrailing
                ? trailing
                : IconButton(
                    onPressed: () {
                      addMessage(widget.messageController.text.trim());
                      widget.messageController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    icon: Icon(Icons.send),
                  ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
