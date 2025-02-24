import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/models/message_model.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({super.key, required this.messageModel});
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 50,
        maxWidth: 150,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!messageModel.isMe)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 20,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
            ),
          Expanded(
            child: BubbleNormal(
              isSender: messageModel.isMe,
              text: messageModel.message,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
