import 'package:flutter/material.dart';
import '../models/message.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MessageDetailItem extends StatelessWidget {
  Widget dateView(String dateval) {
    return Text(
      dateval,
      style: TextStyle(
          color: Colors.grey[700], fontSize: 12, fontFamily: 'GoogleRegular'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messagesdat = Provider.of<Message>(context);
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dateView(
                  '${DateFormat.EEEE().format(messagesdat.messageDate)},${DateFormat.yMMMd().format(messagesdat.messageDate)} '),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[700]),
              ),
              dateView(' ${DateFormat.jm().format(messagesdat.messageDate)}'),
            ],
          ),
          Row(
            mainAxisAlignment: messagesdat.isSend
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: messagesdat.isSend
                      ? Color.fromRGBO(176, 199, 255, 1)
                      : Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(
                  10,
                ),
                child: Text(
                  messagesdat.content,
                  style: TextStyle(
                    color: messagesdat.isSend
                        ? Color.fromRGBO(17, 95, 191, 1)
                        : null,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
