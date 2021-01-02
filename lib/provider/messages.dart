import 'message.dart';
import 'package:flutter/foundation.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [
    Message(
      contactNo: '9384185436',
      messageId: DateTime.parse("2020-12-30 20:15:32"),
      content: 'hi hello first message',
    ),
    Message(
      contactNo: '8072097287',
      messageId: DateTime.parse("2020-12-29 18:25:32"),
      content: 'hi hello first message',
    ),
  ];
  List<Message> get messages {
    return [..._messages];
  }
}
