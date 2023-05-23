import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/models/chat_model.dart';
import '../models/message_model.dart';

import '../models/user_model.dart';
import '../widget/custom_contact.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;
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
            appBar: const _customAppBar(),
            body: Column(
              children: [
                _Contacts(height: height, users: users),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _chatMessages(height: height, chats: chats),
                      _customBottomNavbar(width: width),
                    ],
                  ),
                )
              ],
            )));
  }
}

class _customBottomNavbar extends StatelessWidget {
  const _customBottomNavbar({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.5,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).colorScheme.secondary.withAlpha(150)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.message_rounded)),
            ),
            const SizedBox(width: 20),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.person_add_rounded)),
            )
          ],
        ),
      ),
    );
  }
}

class _chatMessages extends StatelessWidget {
  const _chatMessages({
    super.key,
    required this.height,
    required this.chats,
  });

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return customContainer(
        height: height,
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              // get the other users profiles
              User user =
                  chats[index].users!.where((user) => user.id != '1').first;
              // sort the messages based on the creation time
              chats[index].message.sort(
                  // (a, b) => b.createdAt.compa(a.createAt),
                  (a, b) => b.createdAt.compareTo(a.createdAt));

              // get the last message for the chat preview
              // ignore: unused_local_variable
              Message lastMessage = chats[index].message.first;

              return ListTile(
                onTap: () {
                  Get.toNamed('/chat', arguments: [user, chats[index]]);
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                title: Text(
                  '${user.name} ${user.surname}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  lastMessage.text,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Text(
                  '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }));
  }
}

class _Contacts extends StatelessWidget {
  const _Contacts({
    super.key,
    required this.height,
    required this.users,
  });

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.125,
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user = users[index];
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(user.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            );
          }),
    );
  }
}

class _customAppBar extends StatelessWidget with PreferredSizeWidget {
  const _customAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Chats',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold)),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
              print(Get.isDarkMode);
            },
            icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
