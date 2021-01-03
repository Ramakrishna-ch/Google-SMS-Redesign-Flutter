import 'package:flutter/material.dart';

class MessageDetailScreen extends StatelessWidget {
  static const routeName = '/message-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagedetail'),
        actions: [
          Icon(Icons.video_call_sharp),
          Icon(Icons.call),
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
