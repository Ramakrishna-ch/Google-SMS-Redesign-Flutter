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
                  '${DateFormat.EEEE().format(messagesdat.messageId)},${DateFormat.yMMMd().format(messagesdat.messageId)} '),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[700]),
              ),
              dateView(' ${DateFormat.jm().format(messagesdat.messageId)}'),
            ],
          ),
          messagesdat.isSend
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(176, 199, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: Text(
                        messagesdat.content,
                        style: TextStyle(
                          color: Color.fromRGBO(17, 95, 191, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.purple,
                      size: 45,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: Text(
                        messagesdat.content,
                        style: TextStyle(
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
