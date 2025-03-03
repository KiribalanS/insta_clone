import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:insta_clone/direct_messages/widgets/reply_notes.dart';
import 'package:insta_clone/models/notes_model.dart';
import 'package:text_scroll/text_scroll.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key, required this.note});
  final NotesModel note;
  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final _gifcontroller = GifController(vsync: this);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 5),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _gifcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ReplyNotes(note: widget.note);
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 10, right: 10),
                  child: ClipOval(
                    // clipBehavior: Clip.hardEdge,
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    // ),
                    child: Image(
                      height: 67,
                      width: 75,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/person.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  left: 5,
                  right: 5,
                  child: Card(
                    child: Column(
                      children: [
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
                                  // _controller.repeat();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: SizedBox(
                                  width: 55,
                                  child: TextScroll(
                                    velocity: Velocity(
                                        pixelsPerSecond: Offset(50, 0)),
                                    delayBefore: Duration(seconds: 2),
                                    pauseBetween: Duration(milliseconds: 500),
                                    widget.note.song ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        widget.note.author != null
                            ? TextScroll(
                                widget.note.author!,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            : SizedBox(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            maxLines: 1,
                            "${widget.note.note.substring(0, 7)}${widget.note.note.length > 7 ? "..." : ""}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(widget.note.userName),
          ],
        ),
      ),
    );
  }
}
