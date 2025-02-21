import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif/gif.dart';
import 'package:insta_clone/direct_messages/widgets/message_field.dart';
import 'package:insta_clone/models/notes_model.dart';
import 'package:text_scroll/text_scroll.dart';

class ReplyNotes extends StatefulWidget {
  const ReplyNotes({super.key, required this.note});
  final NotesModel note;
  @override
  State<ReplyNotes> createState() => _ReplyNotesState();
}

class _ReplyNotesState extends State<ReplyNotes> with TickerProviderStateMixin {
  late final GifController _gifcontroller = GifController(vsync: this);
  final notesController = TextEditingController();

  @override
  void dispose() {
    notesController.dispose();
    _gifcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Image(
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/person.jpg"),
                  ),
                ),
              ),
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: widget.note.userName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "shared a note - 20 h ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gif(
                          height: 18,
                          width: 18,
                          image: AssetImage("assets/gif/player.gif"),
                          controller:
                              _gifcontroller, // if duration and fps is null, original gif fps will be used.
                          //fps: 30,
                          //duration: const Duration(seconds: 3),
                          autostart: Autostart.loop,
                          placeholder: (context) => const Text('.'),
                          onFetchCompleted: () {
                            // _controller.forward();
                            // _gif.repeat();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: TextScroll(
                              velocity:
                                  Velocity(pixelsPerSecond: Offset(50, 0)),
                              delayBefore: Duration(seconds: 2),
                              pauseBetween: Duration(milliseconds: 500),
                              widget.note.song ?? "",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.note.note,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MessageField(
                  messageController: notesController,
                  scrollDown: () {},
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 30,
                  Icons.favorite_border,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
