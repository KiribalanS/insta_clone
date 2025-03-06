import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/constants/navigate_profile.dart';
import 'package:insta_clone/direct_messages/cubit/message_cubit.dart';
import 'package:insta_clone/direct_messages/screens/chat_profile.dart';
import 'package:insta_clone/direct_messages/widgets/chat_message.dart';
import 'package:insta_clone/direct_messages/widgets/message_field.dart';
import 'package:insta_clone/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<MessageCubit>().addDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.only(right: 8.0, left: 10),
        //   child: InkWell(
        //     onTap: () => Navigator.pop(context),
        //     child: Center(
        //       child: Icon(
        //         Icons.arrow_back,
        //         size: 35,
        //       ),
        //     ),
        //   ),
        // ),

        leadingWidth: 20,
        title: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatProfile(),
              ),
            );
          },
          minLeadingWidth: 0,
          leading: NavigateProfile(
            child: CircleAvatar(
              radius: 20,
              child: Icon(
                size: 25,
                Icons.person,
              ),
            ),
          ),
          title: NavigateProfile(child: Text("UserName")),
          subtitle: Text("Active status"),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              size: 28,
              color: Theme.of(context).iconTheme.color,
              Icons.call,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              color: Theme.of(context).iconTheme.color,
              size: 35,
              Icons.videocam,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(
            // bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
        child: Column(
          children: [
            BlocConsumer<MessageCubit, List<MessageModel>>(
              listener: (context, state) {},
              builder: (context, state) => Expanded(
                // height: MediaQuery.of(context).size.height * .80,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 1.0, right: 1.0, bottom: 5, top: 5),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return ChatMessageWidget(
                        messageModel: state[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            MessageField(
              messageController: messageController,
              scrollDown: () {
                if (scrollController.hasClients) {
                  final position = scrollController.position.maxScrollExtent;
                  scrollController.jumpTo(position);
                }
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
