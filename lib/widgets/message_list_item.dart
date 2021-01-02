import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'dart:math';

class MessageListItem extends StatelessWidget {
  final List<Color> colors = [
    Colors.orange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.yellow,
    Colors.red
  ];

  final DateTime messageId;
  final String contact;
  final String messagedes;
  MessageListItem({
    @required this.contact,
    @required this.messageId,
    @required this.messagedes,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(contact),
      child: ListTile(
        leading: Icon(
          Icons.account_circle,
          color: colors[Random().nextInt(4)],
          size: 50,
        ),
        title: Text(contact),
        subtitle: Text(messagedes),
        trailing: Text('${DateFormat.jm().format(messageId)}'),
      ),
    );
  }
}
