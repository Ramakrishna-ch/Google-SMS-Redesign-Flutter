import 'package:flutter/material.dart';
import '../models/message.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MessageDetailItem extends StatelessWidget {
  String content;
  DateTime date;
  bool isSend;

  MessageDetailItem(this.content, this.date, this.isSend);
  Widget dateView(String dateval) {
    return Text(
      dateval,
      style: TextStyle(
          color: Colors.grey[700], fontSize: 12, fontFamily: 'GoogleRegular'),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  '${DateFormat.EEEE().format(date)},${DateFormat.yMMMd().format(date)} '),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[700]),
              ),
              dateView(' ${DateFormat.jm().format(date)}'),
            ],
          ),
          Row(
            mainAxisAlignment:
                isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: content.length > 15
                    ? MediaQuery.of(context).size.width * 0.65
                    : null,
                decoration: BoxDecoration(
                  color: isSend
                      ? Color.fromRGBO(211, 227, 250, 1)
                      : Color.fromRGBO(236, 237, 239, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(
                  10,
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    color: isSend ? Color.fromRGBO(17, 95, 191, 1) : null,
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
