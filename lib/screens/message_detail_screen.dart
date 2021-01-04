import 'package:SMS/widgets/message_detail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/messages.dart';

class MessageDetailScreen extends StatelessWidget {
  static const routeName = '/message-detail';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as String;
    final messageData = Provider.of<Messages>(context);
    final contactdata = messageData.messages
        .where((contact) => contact.contactNo == routeArgs)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Icon(
              Icons.video_call_sharp,
              size: 33,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
            child: Icon(
              Icons.call,
              size: 24,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
            child: Icon(
              Icons.search,
              size: 24,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactdata.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: contactdata[index],
          child: MessageDetailItem(),
        ),
      ),
    );
  }
}
