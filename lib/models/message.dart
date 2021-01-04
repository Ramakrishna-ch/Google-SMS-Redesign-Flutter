import 'package:flutter/foundation.dart';

class Message with ChangeNotifier {
  final String contactNo;
  final DateTime messageId;
  final String content;
  final bool isSend;

  Message({
    @required this.contactNo,
    @required this.messageId,
    @required this.content,
    @required this.isSend,
  });
}
