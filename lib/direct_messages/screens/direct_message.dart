import 'package:flutter/material.dart';
import 'package:insta_clone/direct_messages/screens/chat_screen.dart';
import 'package:insta_clone/direct_messages/widgets/notes_widget.dart';
import 'package:insta_clone/models/chat_model.dart';
import 'package:insta_clone/models/notes_model.dart';

class DirectMessage extends StatelessWidget {
  const DirectMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("userName"),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_drop_down_rounded,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 8.0,
                    top: 12,
                    bottom: 10,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, size: 25),
                ),
              ),
            ),
          ),
          //notes
          SizedBox(
            height: MediaQuery.of(context).size.height * .18,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyNotes.length,
              itemBuilder: (context, index) {
                return NotesWidget(note: dummyNotes[index]);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Messages",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Requestes",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.blue,
                      ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyChat.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    print("object");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 25,
                    child: Center(
                      child: Icon(
                        size: 35,
                        Icons.person,
                      ),
                    ),
                  ),
                  title: Text(dummyChat[index].name),
                  subtitle: Text(dummyChat[index].lastMessage),
                  trailing: Icon(Icons.camera_alt_outlined),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
