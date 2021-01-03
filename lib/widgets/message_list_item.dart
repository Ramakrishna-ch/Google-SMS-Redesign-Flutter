import 'package:SMS/screens/message_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../models/message.dart';

class MessageListItem extends StatelessWidget {
  final List<Color> colors = [
    Colors.orange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.yellow,
    Colors.red
  ];

  // final DateTime messageId;
  // final String contact;
  // final String messagedes;
  // MessageListItem({
  //   @required this.contact,
  //   @required this.messageId,
  //   @required this.messagedes,
  // });
  @override
  Widget build(BuildContext context) {
    final messagedata = Provider.of<Message>(context);
    return Dismissible(
      key: ValueKey(messagedata.contactNo),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, MessageDetailScreen.routeName);
        },
        leading: Icon(
          Icons.account_circle,
          color: colors[Random().nextInt(4)],
          size: 50,
        ),
        title: Text(messagedata.contactNo),
        subtitle: Text(messagedata.content),
        trailing: Text('${DateFormat.jm().format(messagedata.messageId)}'),
      ),
    );
  }
}
