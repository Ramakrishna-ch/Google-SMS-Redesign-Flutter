import 'package:flutter/foundation.dart';

class Message {
  final String contactNo;
  final DateTime messageId;
  final String content;

  Message({
    @required this.contactNo,
    @required this.messageId,
    @required this.content,
  });
}
