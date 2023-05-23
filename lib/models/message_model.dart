class Message {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime createdAt;

  Message({
    required this.senderId,
    required this.recipientId,
    required this.text,
    required this.createdAt,
  });

  static List<Message> messages = [
    Message(
        senderId: '1',
        recipientId: '1',
        text: 'Nei bhai !!',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '2',
        recipientId: '1',
        text: 'Tumhra Nit me hogeya mca ka Addmission ?',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '2',
        recipientId: '1',
        text: 'hn bhai me thik hun tu bata',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '1',
        recipientId: '1',
        text: 'how are you dear',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '1',
        recipientId: '2',
        text: 'hey',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '1',
        recipientId: '3',
        text: 'hello world',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '2',
        recipientId: '1',
        text: 'hn bhai bol',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '2',
        recipientId: '1',
        text: 'hello',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '7',
        recipientId: '2',
        text: 'Not so good ?',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '2',
        recipientId: '7',
        text: 'How was your experience at NIT Rourkela',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '3',
        recipientId: '4',
        text: 'Bura tha',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
    Message(
        senderId: '4',
        recipientId: '4',
        text: 'How was your day ?',
        createdAt:
            DateTime(2022, 00, 10, 10, 10).add(const Duration(seconds: 200))),
  ];

  // get createdAt => null;
}
