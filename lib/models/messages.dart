import 'package:SMS/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'message.dart';
import 'package:darq/darq.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [];

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
  }
}
