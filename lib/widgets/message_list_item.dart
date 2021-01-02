import 'package:SMS/provider/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final messageItemdat = Provider.of<Message>(context);

    return Dismissible(
      key: ValueKey(messageItemdat.contactNo),
      child: ListTile(
        leading: Icon(
          Icons.account_circle,
          color: colors[Random().nextInt(4)],
          size: 50,
        ),
        title: Text(messageItemdat.contactNo),
        subtitle: Text(messageItemdat.content),
        trailing: Text('${DateFormat.jm().format(messageItemdat.messageId)}'),
      ),
    );
  }
}
