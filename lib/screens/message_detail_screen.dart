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
    final themecolor = Theme.of(context).accentColor;
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
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: contactdata.length,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: contactdata[index],
              child: MessageDetailItem(),
            ),
          ),
          Positioned(
              height: 55,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: themecolor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add_photo_alternate,
                        size: 30,
                        color: themecolor,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey[350],
                            width: 1.2,
                          )),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 15,
                        left: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              right: 50,
                            ),
                            child: Text(
                              'Text message',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(
                              Icons.emoji_emotions_outlined,
                              size: 25,
                              color: themecolor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            child: Icon(
                              Icons.mic_none,
                              size: 25,
                              color: themecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
