import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/models/message_model.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({super.key, required this.messageModel});
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return BubbleNormal(
      isSender: messageModel.isMe,
      text: messageModel.message,
      color: Colors.blue,
    );
  }
}
