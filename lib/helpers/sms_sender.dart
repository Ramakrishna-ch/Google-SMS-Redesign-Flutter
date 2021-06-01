import 'package:SMS/models/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sms_maintained/sms.dart';

class SMSsend {
  void send(String contact, String body, BuildContext context) {
    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(contact, body);
    print(contact);

    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is Sent!");
        Provider.of<Messages>(context, listen: false)
            .sendMessage(contact, DateTime.now(), body);
      }
      if (state == SmsMessageState.Delivered) {
        print("SMS is Delivered!");
        Provider.of<Messages>(context, listen: false)
            .sendMessage(contact, DateTime.now(), body);
      }
    });
    sender.sendSms(message);
  }
}
