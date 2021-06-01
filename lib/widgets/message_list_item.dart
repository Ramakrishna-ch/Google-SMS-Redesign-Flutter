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
  final DateTime todayDate = DateTime.now();
  // final DateTime messageId;
  // final String contact;
  // final String messagedes;
  // MessageListItem({
  //   @required this.contact,
  //   @required this.messageId,
  //   @required this.messagedes,
  // });

  String dateVal(DateTime dates) {
    if (dates.isAfter(todayDate.subtract(Duration(minutes: 60)))) {
      return todayDate.difference(dates).inMinutes.toString() + ' Min';
    } else if (dates.day == todayDate.day &&
        dates.month == todayDate.month &&
        dates.year == todayDate.year) {
      return DateFormat.jm().format(dates).toString();
    } else if (dates.isAfter(todayDate.subtract(Duration(days: 6)))) {
      return DateFormat.E().format(dates).toString();
    } else if (dates.isAfter(todayDate.subtract(Duration(days: 30)))) {
      return DateFormat.MMMMd().format(dates).toString();
    } else if (dates.isAfter(todayDate.subtract(Duration(days: 365)))) {
      return DateFormat.MMMMd().format(dates).toString();
    } else {
      return DateFormat.yMMM().format(dates).toString();
    }
  }

  Widget archiveIcon(double lefts, double rights, double tops) {
    return Positioned(
      left: lefts,
      top: tops,
      right: rights,
      child: Icon(
        Icons.archive_outlined,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messagedata = Provider.of<Message>(context);
    return Dismissible(
      key: ValueKey(messagedata.contactNo),
      background: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue[700],
          ),
          archiveIcon(20, 300, 24),
          archiveIcon(310, 27, 24),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            MessageDetailScreen.routeName,
            arguments: messagedata.contactNo,
          );
        },
        leading: Icon(
          Icons.account_circle,
          color: colors[Random().nextInt(4)],
          size: 45,
        ),
        title: Text(
          messagedata.contactNo,
          style: TextStyle(fontFamily: 'GoogleMedium'),
        ),
        subtitle: Text(messagedata.content),
        trailing: Text(
          dateVal(messagedata.messageDate),
          style: TextStyle(color: Colors.black87, fontFamily: 'GoogleRegular'),
        ),
      ),
    );
  }
}
