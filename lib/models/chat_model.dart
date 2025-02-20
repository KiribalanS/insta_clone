class ChatModel {
  String name;
  String? profile;
  String lastMessage;
  ChatModel({
    required this.name,
    this.profile,
    required this.lastMessage,
  });
}

List<ChatModel> dummyChat = [
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
  ChatModel(name: "name", lastMessage: "lastMessage"),
];
