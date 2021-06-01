import 'dart:ffi';

import 'package:SMS/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'message.dart';
import 'package:darq/darq.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [
    // Message(
    //   contactNo: '9384185436',
    //   messageDate: DateTime.parse("2020-12-30 20:15:32"),
    //   content: 'first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097287',
    //   messageDate: DateTime.parse("2020-12-29 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '9384185436',
    //   messageId: DateTime.parse("2021-01-01 20:15:32"),
    //   content: 'second message',
    //   isSend: true,
    // ),
    // Message(
    //   contactNo: '8072097287',
    //   messageId: DateTime.parse("2020-12-29 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: true,
    // ),
    // Message(
    //   contactNo: '9791105058',
    //   messageId: DateTime.parse("2021-01-02 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '7401526090',
    //   messageId: DateTime.parse("2021-01-01 20:15:32"),
    //   content: 'second message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '9840105146',
    //   messageId: DateTime.parse("2020-12-29 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097285',
    //   messageId: DateTime.parse("2021-01-03 22:23:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '9791105054',
    //   messageId: DateTime.parse("2021-01-03 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '7401526093',
    //   messageId: DateTime.parse("2019-10-03 20:15:32"),
    //   content: 'second message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '9840105142',
    //   messageId: DateTime.parse("2020-12-23 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
    // Message(
    //   contactNo: '8072097281',
    //   messageId: DateTime.parse("2021-01-02 18:25:32"),
    //   content: 'hi hello first message',
    //   isSend: false,
    // ),
  ];

  List<Message> get messages {
    return [..._messages];
  }

  List<Message> get contactDist {
    _messages.sort((a, b) => b.messageDate.compareTo(a.messageDate));
    return _messages.distinct((d) => d.contactNo).toList();
  }

  Future<void> _addMessage(
      String contact, DateTime messageDate, String content, bool isSend) async {
    _messages.add(Message(
        contactNo: contact,
        content: content,
        messageDate: messageDate,
        isSend: isSend));
    notifyListeners();
    await DBhelper.insert('user_messages', {
      'contactNo': contact,
      'body': content,
      'messageDate': messageDate.toIso8601String(),
      'isSend': isSend.toString(),
    });
  }

  void sendMessage(String contact, DateTime timeDat, String desc) {
    _addMessage(contact, timeDat, desc, true);
  }

  void receiveMessage(String contact, DateTime timeDat, String desc) async {
    _addMessage(contact, timeDat, desc, false);
  }

  Future<void> fetchMessages() async {
    final messagesList = await DBhelper.getData('user_messages');
    _messages = messagesList
        .map(
          (item) => Message(
            contactNo: item['contactNo'],
            content: item['body'],
            messageDate: DateTime.parse(item['messageDate']),
            isSend: item['isSend'] == 'true' ? true : false,
          ),
        )
        .toList();
    notifyListeners();
    print(messagesList);
  }
}
