import 'message_model.dart';
import 'user_model.dart';

class Chat {
  final String? id;
  final List<User>? users;
  final List<Message> message;

  Chat({
    this.id,
    this.users = const <User>[],
    this.message = const <Message>[],
  });

  Chat copywith({
    String? id,
    List<User>? users,
    List<Message>? message,
  }) {
    return Chat(
        id: id ?? this.id,
        users: users ?? this.users,
        message: message ?? this.message);
  }

  static List<Chat> chats = [
    Chat(
      id: '0',
      users:
          User.users.where((user) => user.id == '1' || user.id == '2').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '1' || message.senderId == '2') &
                (message.recipientId == '1' || message.recipientId == '2'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '3' || user.id == '4').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '3' || message.senderId == '4') &
                (message.recipientId == '3' || message.recipientId == '4'),
          )
          .toList(),
    ),
    Chat(
      id: '2',
      users:
          User.users.where((user) => user.id == '1' || user.id == '7').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '2' || message.senderId == '7') &
                (message.recipientId == '7' || message.recipientId == '2'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '3' || user.id == '4').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '3' || message.senderId == '4') &
                (message.recipientId == '3' || message.recipientId == '4'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '3' || user.id == '4').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '3' || message.senderId == '4') &
                (message.recipientId == '3' || message.recipientId == '4'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '3' || user.id == '4').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '3' || message.senderId == '4') &
                (message.recipientId == '3' || message.recipientId == '4'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '3' || user.id == '4').toList(),
      message: Message.messages
          .where(
            (message) =>
                (message.senderId == '3' || message.senderId == '4') &
                (message.recipientId == '3' || message.recipientId == '4'),
          )
          .toList(),
    ),
  ];
}
