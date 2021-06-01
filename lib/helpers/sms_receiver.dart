import 'package:SMS/models/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sms_maintained/sms.dart';

class SMSreceiver {
  void receive(BuildContext context) {
    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      Provider.of<Messages>(context, listen: false)
          .receiveMessage(msg.address, DateTime.now(), msg.body);
    });
  }
}
