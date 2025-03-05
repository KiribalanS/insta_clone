import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/post/send/cubit/send_count_cubit.dart';
import 'package:insta_clone/post/send/widgets/custom_outline_button.dart';
import 'package:insta_clone/post/send/widgets/custom_send_button.dart';
import 'package:insta_clone/post/send/widgets/send_user_widget.dart';

class ShowSend extends StatefulWidget {
  const ShowSend({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<ShowSend> createState() => _ShowSendState();
}

class _ShowSendState extends State<ShowSend> {
  @override
  Widget build(BuildContext context) {
    int count = context.watch<SendCountCubit>().state;
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Card(
        // color: Colros.,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 20,
              child: Divider(
                height: 3,
                thickness: 3,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Card(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.person_add),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                controller: widget.controller,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // childAspectRatio: .5,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  // mainAxisExtent: 1,
                ),
                itemBuilder: (context, index) {
                  return SendUserWidget();
                },
              ),
            ),
            if (count <= 0)
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
              ),
            if (count == 1) CustomSendButton(content: "Send"),
            if (count > 1)
              Column(
                children: [
                  CustomSendButton(content: "Send separately"),
                  CustomOutlineButton(),
                ],
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
