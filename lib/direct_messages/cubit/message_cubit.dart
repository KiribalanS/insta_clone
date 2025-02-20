import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/models/message_model.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<List<MessageModel>> {
  MessageCubit() : super([]);

  void addMessage(MessageModel message) {
    emit([...state, message]);
  }

  void addDummyData() {
    state.addAll(
      [
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
        MessageModel(message: "message", isMe: false),
        MessageModel(message: "message", isMe: true),
      ],
    );
    emit([...state]);
  }
}
