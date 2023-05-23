import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:my_app/models/chat_model.dart';
import 'package:my_app/models/message_model.dart';

import '../models/user_model.dart';
import '../widget/custom_contact.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  @override
  late User users;
  late Chat chat;
  late String text;
  void initState() {
    users = Get.arguments[0];
    chat = Get.arguments[1];
    textEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        )),
        child: Scaffold(
            appBar: _customAppBar(
              user: users,
            ),
            body: customContainer(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  _chatsMessages(
                      chat: chat, scrollController: scrollController),
                  TextFormField(
                    controller: textEditingController,
                    onChanged: (value) {
                      setState(() {
                        text = value;
                        print(value);
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(150),
                        hintText: 'Type here ......',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.all(20.0),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Message message = Message(
                                senderId: '1',
                                // recipientId: '2',
                                recipientId: users.id,
                                text: text,
                                createdAt: DateTime.now());
                            List<Message> messages = List.from(chat.message)
                              ..add(message);

                            messages.sort(
                                (a, b) => b.createdAt.compareTo(a.createdAt));

                            setState(() {
                              chat = chat.copywith(message: messages);
                            });
                            scrollController.animateTo(
                                scrollController.position.minScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceInOut);

                            textEditingController.clear();
                          },
                          icon: const Icon(Icons.send),
                        )),
                  )
                ],
              ),
            )));
  }
}

class _chatsMessages extends StatelessWidget {
  const _chatsMessages({
    super.key,
    required this.chat,
    required this.scrollController,
  });

  final Chat chat;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      // demo time
      reverse: true,
      itemCount: chat.message.length,
      itemBuilder: (context, index) {
        Message message = chat.message[index];
        return Align(
          alignment: (message.senderId == '1')
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.66),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (message.senderId == '1')
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(message.text),
          ),
        );
      },
    ));
  }
}

class _customAppBar extends StatelessWidget with PreferredSizeWidget {
  const _customAppBar({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          // change it
          Text('Online', style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
