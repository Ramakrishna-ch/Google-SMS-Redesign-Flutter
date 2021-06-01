import 'package:flutter/foundation.dart';

class Message with ChangeNotifier {
  final String contactNo;
  final DateTime messageDate;
  final String content;
  final bool isSend;

  Message({
    @required this.contactNo,
    @required this.messageDate,
    @required this.content,
    @required this.isSend,
  });
}
