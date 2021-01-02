import 'message.dart';

import 'package:darq/darq.dart';

class Messages {
  List<Message> _messages = [
    Message(
      contactNo: '9384185436',
      messageId: DateTime.parse("2020-12-30 20:15:32"),
      content: 'first message',
    ),
    Message(
      contactNo: '8072097287',
      messageId: DateTime.parse("2020-12-29 18:25:32"),
      content: 'hi hello first message',
    ),
    Message(
      contactNo: '9384185436',
      messageId: DateTime.parse("2021-01-01 20:15:32"),
      content: 'second message',
    ),
    Message(
      contactNo: '8072097287',
      messageId: DateTime.parse("2020-12-29 18:25:32"),
      content: 'hi hello first message',
    ),
    Message(
      contactNo: '9791105058',
      messageId: DateTime.parse("2021-01-02 18:25:32"),
      content: 'hi hello first message',
    ),
  ];

  List<Message> get messages {
    return [..._messages];
  }

  List<Message> get contactDist {
    _messages.sort((a, b) => b.messageId.compareTo(a.messageId));
    return _messages.distinct((d) => d.contactNo).toList();
  }
}
