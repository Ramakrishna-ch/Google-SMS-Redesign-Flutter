import 'dart:async';

import 'package:SMS/helpers/sms_receiver.dart';
import 'package:SMS/helpers/sms_sender.dart';
import 'package:SMS/widgets/message_detail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_maintained/sms.dart';
import '../models/messages.dart';

class MessageDetailScreen extends StatefulWidget {
  static const routeName = '/message-detail';

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  TextEditingController textMessage;
  bool endLine = false;
  int lines = 0;
  var mesbody = '';

  @override
  void initState() {
    textMessage = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textMessage.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                reverse: true,
                itemCount: contactdata.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: contactdata[index],
                  child: MessageDetailItem(),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.transparent,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 7,
            ),
            child: Row(
              children: <Widget>[
                !endLine
                    ? Row(
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
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.grey[350],
                          width: 1.2,
                        )),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: textMessage,
                              onChanged: (text) {
                                if (text.length >= 16) {
                                  setState(() {
                                    endLine = true;
                                  });
                                  if (text.length >= 22) {
                                    if (text.length >= 44) {
                                      if (text.length >= 66) {
                                        setState(() {
                                          lines = 3;
                                          mesbody = text;
                                        });

                                        return;
                                      }
                                      setState(() {
                                        lines = 2;
                                        mesbody = text;
                                      });
                                      return;
                                    }
                                    setState(() {
                                      lines = 1;
                                      mesbody = text;
                                    });
                                    return;
                                  }
                                  setState(() {
                                    lines = 0;
                                    mesbody = text;
                                  });
                                  return;
                                }
                                setState(() {
                                  endLine = false;
                                  lines = 0;
                                  mesbody = text;
                                });
                              },
                              maxLines: lines + 1,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: 'Text Message',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ))),
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
                        textMessage.text.isEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: Icon(
                                  Icons.mic_none,
                                  size: 25,
                                  color: themecolor,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.send,
                                    size: 25,
                                    color: themecolor,
                                  ),
                                  onPressed: () {
                                    SMSsend send = SMSsend();
                                    send.send(routeArgs, mesbody, context);
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
